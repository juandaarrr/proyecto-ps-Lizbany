"""Verifica Control_Terapias_Lizbany.xlsx y genera el resumen financiero semanal.

Uso:
    python verificar-y-resumir.py <xlsx> [--hoy AAAA-MM-DD] [--solo-verificar | --solo-resumen]

- Solo LEE el archivo (no lo modifica). Lee los valores guardados por Excel, asi que hay que
  ejecutarlo despues de registrar-semana.ps1 (que recalcula y guarda).
- Codigo de salida 0 = todo bien; 1 = alguna verificacion fallo (restaurar el respaldo y avisar).
- El resumen NO incluye nombres de pacientes: solo identificadores (P001...).
"""
import re
import sys
import zipfile
import datetime as dt
import warnings

warnings.filterwarnings("ignore")
import openpyxl

args = sys.argv[1:]
if not args:
    print(__doc__)
    sys.exit(2)
path = args[0]
hoy = dt.date.today()
if "--hoy" in args:
    hoy = dt.datetime.strptime(args[args.index("--hoy") + 1], "%Y-%m-%d").date()
solo_verificar = "--solo-verificar" in args
solo_resumen = "--solo-resumen" in args

HOJAS = ["Pacientes", "Pagos", "Seguimiento", "Resumen mensual", "Resumen semanal", "Panel", "Hoja1"]
INICIO = dt.date(2026, 8, 17)  # lunes de la primera semana de Resumen semanal
SEMANAS = 60


def money(v):
    v = v or 0
    signo = "-" if v < 0 else ""
    return signo + "$ " + f"{abs(v):,.0f}".replace(",", ".")


def d(v):
    return v.date() if hasattr(v, "date") else v


wb = openpyxl.load_workbook(path, data_only=True)
fallos = []


def check(ok, texto):
    print(("  OK    " if ok else "  FALLA ") + texto)
    if not ok:
        fallos.append(texto)


if not solo_resumen:
    print("VERIFICACION")
    check(all(h in wb.sheetnames for h in HOJAS), "existen las 7 hojas: " + ", ".join(HOJAS))
    errores = 0
    for ws in wb.worksheets:
        for row in ws.iter_rows():
            for c in row:
                if isinstance(c.value, str) and c.value.startswith("#"):
                    errores += 1
    check(errores == 0, f"ninguna celda con error ({errores} encontradas)")

    z = zipfile.ZipFile(path)
    hojas_xml = [n for n in z.namelist() if re.match(r"xl/worksheets/sheet\d+\.xml$", n)]
    xml = "".join(z.read(n).decode("utf8", "ignore") for n in hojas_xml)
    check("<xm:sqref>D4:D1000</xm:sqref>" in xml, "lista desplegable de modalidad en Pagos D4:D1000 (extension x14)")
    check('sqref="G4:G1000"' in xml and "Pago pendiente" in xml, "lista desplegable de estado de pago en Pagos G4:G1000")
    check("conditionalFormatting" in xml, "formato condicional de 'Pago pendiente' presente")
    graficos = [n for n in z.namelist() if re.match(r"xl/charts/chart\d+\.xml$", n)]
    check(len(graficos) == 5, f"5 graficos en el Panel ({len(graficos)} encontrados)")

    pag = wb["Pagos"]
    filas = [r for r in pag.iter_rows(min_row=4, values_only=True) if r[0]]
    fechas = [d(r[0]) for r in filas]
    check(all(INICIO <= f < INICIO + dt.timedelta(days=7 * SEMANAS) for f in fechas),
          f"todas las fechas de Pagos caen dentro de las {SEMANAS} semanas de Resumen semanal")
    rs = wb["Resumen semanal"]
    total_semanal = sum((rs.cell(4 + k, 9).value or 0) for k in range(SEMANAS))
    total_pagos = sum((r[5] or 0) for r in filas)
    check(total_semanal == total_pagos, f"suma de ingresos semanales ({money(total_semanal)}) = suma de 'Valor recibido' en Pagos ({money(total_pagos)})")
    rm = wb["Resumen mensual"]
    mes = d(rm["B3"].value)
    sig = (mes.replace(day=28) + dt.timedelta(days=4)).replace(day=1)
    rec_mes = sum((r[5] or 0) for r in filas if mes <= d(r[0]) < sig)
    cob_mes = sum((r[4] or 0) for r in filas if mes <= d(r[0]) < sig)
    check(rm["B5"].value == rec_mes, f"'Ingresos recibidos en el mes' ({money(rm['B5'].value)}) coincide con Pagos ({money(rec_mes)})")
    check(rm["B6"].value == cob_mes, f"'Cobros registrados en el mes' ({money(rm['B6'].value)}) coincide con Pagos ({money(cob_mes)})")
    seg = wb["Seguimiento"]
    negativos = [seg.cell(r, 9).value for r in range(4, 40) if isinstance(seg.cell(r, 9).value, (int, float)) and seg.cell(r, 9).value < 0]
    check(not negativos, "ningun saldo negativo en Seguimiento")
    pac = wb["Pacientes"]
    nombres_pac = {str(r[1]).lower() for r in pac.iter_rows(min_row=4, values_only=True) if r[1]}
    desconocidos = {str(r[1]) for r in filas if str(r[1]).lower() not in nombres_pac}
    check(not desconocidos, "todos los pacientes de Pagos existen en la hoja Pacientes")
    print("VERIFICACION:", "TODO BIEN" if not fallos else f"{len(fallos)} FALLOS -> restaurar el respaldo y avisar a Lizbany")

if not solo_verificar:
    rs = wb["Resumen semanal"]
    pos = [k for k in range(SEMANAS) if INICIO + dt.timedelta(days=7 * k) <= hoy]
    if not pos:
        print("La fecha de hoy es anterior al inicio del Resumen semanal.")
        sys.exit(1)
    k = pos[-1]
    if k >= SEMANAS:
        print("Hay que extender la hoja Resumen semanal: la fecha esta fuera de las 60 semanas.")
        sys.exit(1)

    def bloque(titulo, kk):
        r = 4 + kk
        a, b = d(rs.cell(r, 1).value), d(rs.cell(r, 2).value)
        v = lambda c: rs.cell(r, c).value or 0
        print(f"{titulo} ({a:%d/%m} al {b:%d/%m})")
        print(f"  Sesiones realizadas: {v(4)}  (diagnostica: {v(5)} | individual: {v(6)} | paquete: {v(7)})")
        print(f"  Cobros registrados:    {money(v(8))}")
        print(f"  Ingresos recibidos:    {money(v(9))}")
        print(f"  Pendiente por cobrar:  {money(v(10))}")
        print(f"  Ingresos por forma de pago: Nequi {money(v(11))} | Llave Bancolombia {money(v(12))} | Otras {money(v(13))}")
        return r

    print(f"RESUMEN FINANCIERO - {hoy:%d/%m/%Y}")
    print()
    if k >= 1:
        bloque("SEMANA ANTERIOR (cerrada)", k - 1)
        print()
    rc = bloque("SEMANA EN CURSO (parcial, de lunes a hoy)", k)
    print()
    print(f"Acumulado del mes: {money(rs.cell(rc, 14).value)}")
    var = rs.cell(rc, 15).value
    pct = rs.cell(rc, 16).value
    if var is not None:
        extra = f" ({pct:+.0%})" if isinstance(pct, (int, float)) else ""
        print(f"Variacion vs semana anterior: {'+' if var >= 0 else ''}{money(var)}{extra}")
    panel = wb["Panel"]
    saldos = []
    for i in range(30):
        idv, sal = panel.cell(95 + i, 1).value, panel.cell(95 + i, 2).value
        if idv and isinstance(sal, (int, float)) and sal > 0:
            saldos.append(f"{idv} {money(sal)}")
    print("Saldos pendientes por paciente: " + (" | ".join(saldos) if saldos else "ninguno"))
    if (rs.cell(rc, 17).value or "") == "sin movimientos":
        print("Observaciones: semana en curso sin movimientos")

sys.exit(1 if fallos else 0)
