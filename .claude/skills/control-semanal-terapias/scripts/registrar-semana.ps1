# Registra sesiones y pagos en Control_Terapias_Lizbany.xlsx usando Excel por COM
# (conserva formulas, listas desplegables, formato condicional y graficos).
#
# Uso:
#   powershell -NoProfile -ExecutionPolicy Bypass -File registrar-semana.ps1 -Path <xlsx> -Datos <json> [-SoloValidar]
#
# Si hay preguntas pendientes (datos faltantes, precios que no coinciden, duplicados, paciente desconocido)
# NO escribe nada: imprime lineas "PREGUNTA|..." y termina con codigo 2. Claude debe preguntar a Lizbany y
# volver a ejecutar con el JSON corregido (o con "precio_confirmado" / "duplicado_confirmado" en la fila).
# Mensajes en ASCII (sin tildes) para evitar problemas de codificacion en la consola.
param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][string]$Datos,
    [switch]$SoloValidar
)
$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture

# ---------- Precios vigentes (confirmados por Lizbany el 2026-10-06) ----------
$P_CONSULTA = 110000; $P_DIAG = 90000; $P_PAQUETE = 380000; $P_PAQUETE_DIAG = 470000
$ESTADOS = @('Pagado', 'Pago pendiente', 'Abono recibido')

function Serial([datetime]$d) { return [int]$d.Date.ToOADate() }
function Num($v) { return ([double]$v).ToString($inv) }
function Parse-Fecha($s) {
    try { return [datetime]::ParseExact([string]$s, 'yyyy-MM-dd', $inv) } catch { return $null }
}

if (-not (Test-Path -LiteralPath $Path)) { 'ERROR|El archivo no existe: ' + $Path + ' (ejecuta el comando desde la carpeta del proyecto, donde esta la carpeta CUADRO CONTROL)'; exit 3 }
if (-not (Test-Path -LiteralPath $Datos)) { 'ERROR|El archivo de datos no existe: ' + $Datos; exit 3 }
# Excel resuelve las rutas relativas desde su propia carpeta, no desde la del proyecto: usar rutas completas
$Path = (Resolve-Path -LiteralPath $Path).Path
$Datos = (Resolve-Path -LiteralPath $Datos).Path
try { $fs = [System.IO.File]::Open($Path, 'Open', 'ReadWrite', 'None'); $fs.Close() }
catch { 'ERROR|El archivo esta abierto en otro programa o bloqueado. Pide a Lizbany que cierre Excel. No se modifico nada.'; exit 3 }

$json = Get-Content -Raw -Encoding UTF8 $Datos | ConvertFrom-Json
$pagos = @($json.pagos | Where-Object { $_ }); $pacsNuevos = @($json.pacientes | Where-Object { $_ }); $segs = @($json.seguimiento | Where-Object { $_ })

$xl = New-Object -ComObject Excel.Application
$xl.Visible = $false
$xl.DisplayAlerts = $false
$wb = $null
try {
    $wb = $xl.Workbooks.Open($Path)
    $wsP = $wb.Worksheets.Item('Pagos')
    $wsC = $wb.Worksheets.Item('Pacientes')
    $wsS = $wb.Worksheets.Item('Seguimiento')
    $wsH = $wb.Worksheets.Item('Hoja1')
    $MODALIDADES = @(1..3 | ForEach-Object { [string]$wsH.Cells.Item($_, 1).Text })

    # ---- Pacientes existentes (ID -> nombre) ----
    $mapa = @{}      # clave en minusculas (id o nombre) -> nombre oficial
    $r = 4
    while ($wsC.Cells.Item($r, 1).Text -ne '') {
        $id = [string]$wsC.Cells.Item($r, 1).Text; $nom = [string]$wsC.Cells.Item($r, 2).Text
        $mapa[$id.ToLower()] = $nom; $mapa[$nom.ToLower()] = $nom
        $r++
    }
    $ultimoPac = $r - 1
    foreach ($pn in $pacsNuevos) {
        if ($pn.id -and $pn.nombre) { $mapa[([string]$pn.id).ToLower()] = [string]$pn.nombre; $mapa[([string]$pn.nombre).ToLower()] = [string]$pn.nombre }
    }

    # ---- Filas existentes de Pagos (para detectar duplicados) ----
    $existentes = @()
    $r = 4
    while ($wsP.Cells.Item($r, 1).Text -ne '') {
        $existentes += [pscustomobject]@{
            f = [int]$wsP.Cells.Item($r, 1).Value2; p = ([string]$wsP.Cells.Item($r, 2).Text).ToLower()
            c = [double]$wsP.Cells.Item($r, 5).Value2; rc = [double]$wsP.Cells.Item($r, 6).Value2
        }
        $r++
    }
    $primeraLibre = $r

    # ---- Validacion: preguntas ----
    $preguntas = New-Object System.Collections.ArrayList
    $filas = New-Object System.Collections.ArrayList
    $n = 0
    foreach ($p in $pagos) {
        $n++
        $q = New-Object System.Collections.ArrayList
        foreach ($campo in 'fecha', 'paciente', 'tipo', 'modalidad', 'estado') {
            if ([string]::IsNullOrWhiteSpace([string]$p.$campo)) { [void]$q.Add("falta el dato '$campo'") }
        }
        if ($null -eq $p.cobrado -or [string]$p.cobrado -eq '') { [void]$q.Add("falta el valor cobrado") }
        if ($null -eq $p.recibido -or [string]$p.recibido -eq '') { [void]$q.Add("falta el valor recibido") }
        $f = $null
        if ($p.fecha) {
            $f = Parse-Fecha $p.fecha
            if ($null -eq $f) { [void]$q.Add("la fecha '" + $p.fecha + "' no tiene el formato AAAA-MM-DD") }
        }
        $nombre = $null
        if ($p.paciente) {
            $k = ([string]$p.paciente).ToLower()
            if ($mapa.ContainsKey($k)) { $nombre = $mapa[$k] } else { [void]$q.Add("el paciente '" + $p.paciente + "' no esta en la hoja Pacientes: es un paciente nuevo o hay un error de escritura?") }
        }
        if ($p.estado -and ($ESTADOS -notcontains [string]$p.estado)) { [void]$q.Add("el estado '" + $p.estado + "' no es valido (usar: " + ($ESTADOS -join ', ') + ")") }
        if ($p.modalidad -and ($MODALIDADES -notcontains [string]$p.modalidad)) { [void]$q.Add("la modalidad '" + $p.modalidad + "' no es valida (usar: " + ($MODALIDADES -join ', ') + ")") }
        $cob = 0.0; $rec = 0.0
        if ($p.cobrado -ne $null -and [string]$p.cobrado -ne '') { $cob = [double]$p.cobrado }
        if ($p.recibido -ne $null -and [string]$p.recibido -ne '') { $rec = [double]$p.recibido }
        if ($cob -lt 0 -or $rec -lt 0) { [void]$q.Add("hay valores negativos") }
        if ($rec -gt 0 -and [string]::IsNullOrWhiteSpace([string]$p.forma_pago)) { [void]$q.Add("falta la forma de pago (se recibio dinero)") }

        # Coherencia estado / valores
        if ($p.estado -eq 'Pagado' -and $cob -gt 0 -and $rec -lt $cob) { [void]$q.Add("el estado es 'Pagado' pero lo recibido ($rec) es menor que lo cobrado ($cob): es un abono?") }
        if ($p.estado -eq 'Pago pendiente' -and $rec -ne 0) { [void]$q.Add("el estado es 'Pago pendiente' pero hay valor recibido ($rec)") }
        if ($p.estado -eq 'Abono recibido' -and $cob -gt 0 -and $rec -ge $cob) { [void]$q.Add("el estado es 'Abono recibido' pero lo recibido cubre todo lo cobrado: es pago total?") }

        # Precios vigentes
        if (-not $p.precio_confirmado -and $p.tipo) {
            $t = ([string]$p.tipo).ToLower()
            if ($t -like 'consulta diagn*' -and $cob -ne $P_DIAG) { [void]$q.Add("el diagnostico se cobra a $P_DIAG y aqui se cobro ${cob}: confirmas ese valor?") }
            elseif ($t -like 'consulta individual*' -and $cob -ne $P_CONSULTA) { [void]$q.Add("la consulta se cobra a $P_CONSULTA y aqui se cobro ${cob}: confirmas ese valor?") }
            elseif ($t -like 'consulta 1 de paquete*' -and $cob -ne $P_PAQUETE -and $cob -ne $P_PAQUETE_DIAG) { [void]$q.Add("el paquete de 4 consultas se cobra a $P_PAQUETE ($P_PAQUETE_DIAG si incluye el diagnostico) y aqui se cobro ${cob}: confirmas ese valor?") }
            elseif ($t -like 'consulta [234] de paquete*' -and $cob -ne 0) { [void]$q.Add("las consultas 2 a 4 de un paquete llevan cobrado 0 (el paquete se cobra en la 1) y aqui se cobro ${cob}: confirmas?") }
        }

        # Duplicados
        if ($f -and $nombre -and -not $p.duplicado_confirmado) {
            $s = Serial $f
            $dup = $existentes | Where-Object { $_.f -eq $s -and $_.p -eq $nombre.ToLower() -and $_.c -eq $cob -and $_.rc -eq $rec }
            if ($dup) { [void]$q.Add("ya existe una fila igual (misma fecha, paciente y valores): es un duplicado o una sesion distinta?") }
            $mismoLote = $filas | Where-Object { $_.p -and $_.f -eq $s -and $_.p.ToLower() -eq $nombre.ToLower() -and $_.cob -eq $cob -and $_.rec -eq $rec }
            if ($mismoLote) { [void]$q.Add("esta fila es igual a otra del mismo envio: es un duplicado?") }
        }

        foreach ($m in $q) { [void]$preguntas.Add(("PREGUNTA|pago {0} ({1}|{2})|{3}" -f $n, $p.fecha, $p.paciente, $m)) }
        [void]$filas.Add([pscustomobject]@{ f = $(if ($f) { Serial $f } else { 0 }); p = $nombre; cob = $cob; rec = $rec; src = $p })
    }
    foreach ($sg in $segs) {
        if (-not $sg.paciente) { [void]$preguntas.Add("PREGUNTA|seguimiento|falta el paciente") }
        elseif (-not $mapa.ContainsKey(([string]$sg.paciente).ToLower())) { [void]$preguntas.Add("PREGUNTA|seguimiento ($($sg.paciente))|el paciente no esta en la hoja Pacientes") }
    }
    if ($pagos.Count -eq 0 -and $pacsNuevos.Count -eq 0 -and $segs.Count -eq 0) { [void]$preguntas.Add("PREGUNTA|envio|no hay nada que registrar: la semana es 'sin movimientos'? (en ese caso no se modifica el archivo)") }

    if ($preguntas.Count -gt 0) {
        $preguntas | ForEach-Object { $_ }
        'RESULTADO|PREGUNTAS_PENDIENTES|' + $preguntas.Count + '|no se modifico el archivo'
        $wb.Close($false); $wb = $null
        exit 2
    }
    if ($SoloValidar) {
        'RESULTADO|VALIDACION_OK|' + $pagos.Count + ' pagos, ' + $pacsNuevos.Count + ' pacientes, ' + $segs.Count + ' seguimientos|no se modifico el archivo'
        $wb.Close($false); $wb = $null
        exit 0
    }

    # ---------- Respaldo ----------
    $carpeta = Join-Path (Split-Path $Path -Parent) 'respaldos'
    if (-not (Test-Path $carpeta)) { New-Item -ItemType Directory -Path $carpeta | Out-Null }
    $stamp = (Get-Date).ToString('yyyy-MM-dd_HHmmss')
    $respaldo = Join-Path $carpeta ("Control_Terapias_Lizbany_" + $stamp + "_antes-registro.xlsx")
    $wb.Close($false); $wb = $null
    Copy-Item $Path $respaldo
    $h1 = (Get-FileHash $Path -Algorithm SHA256).Hash; $h2 = (Get-FileHash $respaldo -Algorithm SHA256).Hash
    if ($h1 -ne $h2) { throw 'El respaldo no coincide con el archivo original' }
    Get-ChildItem $carpeta -Filter '*_antes-registro.xlsx' | Sort-Object LastWriteTime -Descending | Select-Object -Skip 4 | Remove-Item
    'OK|respaldo creado: ' + $respaldo

    # ---------- Escritura ----------
    $wb = $xl.Workbooks.Open($Path)
    $wsP = $wb.Worksheets.Item('Pagos'); $wsC = $wb.Worksheets.Item('Pacientes'); $wsS = $wb.Worksheets.Item('Seguimiento')

    # Pacientes nuevos / cambios
    $filaPac = $ultimoPac + 1
    foreach ($pn in $pacsNuevos) {
        $existe = $false
        for ($rr = 4; $rr -le $ultimoPac; $rr++) { if ($wsC.Cells.Item($rr, 1).Text -eq [string]$pn.id) { $existe = $rr; break } }
        if ($existe) {
            if ($pn.estado) { $wsC.Cells.Item($existe, 5).Value2 = [string]$pn.estado }
            if ($pn.modalidad) { $wsC.Cells.Item($existe, 4).Value2 = [string]$pn.modalidad }
            if ($pn.notas) { $wsC.Cells.Item($existe, 6).Value2 = [string]$pn.notas }
            'OK|paciente actualizado: ' + $pn.id
        } else {
            $wsC.Cells.Item($filaPac, 1).Value2 = [string]$pn.id
            $wsC.Cells.Item($filaPac, 2).Value2 = [string]$pn.nombre
            if ($pn.inicio) { $wsC.Cells.Item($filaPac, 3).Formula = [string](Serial (Parse-Fecha $pn.inicio)); $wsC.Cells.Item($filaPac, 3).NumberFormat = $wsC.Cells.Item(4, 3).NumberFormat }
            $wsC.Cells.Item($filaPac, 4).Value2 = [string]$pn.modalidad
            $wsC.Cells.Item($filaPac, 5).Value2 = $(if ($pn.estado) { [string]$pn.estado } else { 'Activo' })
            if ($pn.notas) { $wsC.Cells.Item($filaPac, 6).Value2 = [string]$pn.notas }
            'OK|paciente nuevo: ' + $pn.id
            $filaPac++
        }
    }

    # Pagos
    $fila = $primeraLibre
    $prev = $primeraLibre - 1
    foreach ($x in $filas) {
        $p = $x.src
        $wsP.Cells.Item($fila, 1).Formula = [string]$x.f
        $wsP.Cells.Item($fila, 2).Value2 = [string]$x.p
        $wsP.Cells.Item($fila, 3).Value2 = [string]$p.tipo
        $wsP.Cells.Item($fila, 4).Value2 = [string]$p.modalidad
        $wsP.Cells.Item($fila, 5).Formula = (Num $x.cob)
        $wsP.Cells.Item($fila, 6).Formula = (Num $x.rec)
        $wsP.Cells.Item($fila, 7).Value2 = [string]$p.estado
        if ($p.forma_pago) { $wsP.Cells.Item($fila, 8).Value2 = [string]$p.forma_pago }
        if ($p.observaciones) { $wsP.Cells.Item($fila, 9).Value2 = [string]$p.observaciones }
        foreach ($c in 1..9) { $wsP.Cells.Item($fila, $c).NumberFormat = $wsP.Cells.Item($prev, $c).NumberFormat }
        $fila++
    }
    'OK|pagos registrados: ' + $filas.Count + ' (filas ' + $primeraLibre + ' a ' + ($fila - 1) + ')'

    # Seguimiento
    foreach ($sg in $segs) {
        $nombre = $mapa[([string]$sg.paciente).ToLower()]
        $rs = 0
        for ($rr = 4; $rr -le 60; $rr++) { if ($wsS.Cells.Item($rr, 1).Text -eq $nombre) { $rs = $rr; break } }
        if ($rs -eq 0) {
            $rs = 4; while ($wsS.Cells.Item($rs, 1).Text -ne '') { $rs++ }
            $wsS.Cells.Item($rs, 1).Value2 = $nombre
            if ($sg.modalidad) { $wsS.Cells.Item($rs, 2).Value2 = [string]$sg.modalidad }
            if ($sg.inicio) { $wsS.Cells.Item($rs, 3).Formula = [string](Serial (Parse-Fecha $sg.inicio)) }
            $wsS.Cells.Item($rs, 4).Formula = $(if ($sg.incluidas -ne $null) { Num $sg.incluidas } else { '0' })
            $wsS.Cells.Item($rs, 7).Formula = $(if ($sg.total_plan -ne $null) { Num $sg.total_plan } else { '0' })
            $wsS.Cells.Item($rs, 8).Formula = ('=SUMIF(Pagos!B:B,A{0},Pagos!F:F)' -f $rs)
            $wsS.Cells.Item($rs, 9).Formula = ('=IF(G{0}>0,MAX(G{0}-H{0},0),SUMIF(Pagos!B:B,A{0},Pagos!E:E)-H{0})' -f $rs)
            foreach ($c in 1..11) { $wsS.Cells.Item($rs, $c).NumberFormat = $wsS.Cells.Item(4, $c).NumberFormat }
            'OK|fila nueva en Seguimiento: ' + $sg.paciente
        }
        if ($sg.realizadas -ne $null) { $wsS.Cells.Item($rs, 5).Formula = (Num $sg.realizadas) }
        $wsS.Cells.Item($rs, 6).Formula = ('=IF(B{0}="Plan mensual",D{0}-E{0},0)' -f $rs)
        if ($sg.ultima) { $wsS.Cells.Item($rs, 10).Formula = [string](Serial (Parse-Fecha $sg.ultima)) }
        if ($sg.proxima) { $wsS.Cells.Item($rs, 11).Formula = [string](Serial (Parse-Fecha $sg.proxima)) }
        'OK|seguimiento actualizado: ' + $sg.paciente
    }

    $xl.CalculateFull()
    $wb.Save()
    $errs = 0
    foreach ($s in $wb.Worksheets) { foreach ($cell in $s.UsedRange.Cells) { if ($cell.Text -like '#*') { $errs++ } } }
    $wb.Close($false); $wb = $null
    'RESULTADO|REGISTRO_OK|celdas con error: ' + $errs + '|respaldo: ' + $respaldo
    if ($errs -gt 0) { exit 4 }
    exit 0
}
catch {
    'ERROR|linea ' + $_.InvocationInfo.ScriptLineNumber + ': ' + $_.Exception.Message
    exit 3
}
finally {
    if ($wb) { try { $wb.Close($false) } catch {} }
    $xl.Quit()
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($xl) | Out-Null
}
