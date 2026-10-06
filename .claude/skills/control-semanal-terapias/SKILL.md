---
name: control-semanal-terapias
description: Actualiza el Excel de control de terapias de Lizbany Arango (sesiones, pagos, pacientes, seguimiento de planes) a partir de lo que ella envía por el chat, y entrega el resumen financiero semanal. Úsalo siempre que Lizbany (o quien la ayude) envíe sesiones o pagos, pacientes nuevos o cambios de estado, o diga "actualizar el control", "registrar la semana", "resumen financiero", "ingresos de la semana", "puesta al día", o cuando sea viernes y toque el ciclo semanal, aunque no nombre el skill.
---

# Control semanal de terapias (Lizbany Arango)

Registra en `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx` lo que Lizbany envía por el chat, verifica que el archivo quede sano y le entrega el resumen de sus entradas de capital. Spec: `specs/plan-marketing-redes/` (Req. 10). Procedimiento aprobado: `marketing/procedimiento-financiero-semanal.md`.

Habla en español, con tono cálido y sencillo: Lizbany no es técnica.

## Reglas que no se rompen

- **Privacidad.** El Excel tiene nombres de pacientes y pagos reales. Al hablar de pacientes y en los resúmenes usa **solo el ID** (P001, P002...). Nunca copies datos de pacientes ni de pagos a un archivo del repositorio, a un commit, a la hoja de marketing ni a `marketing/`. El JSON de cada envío se crea **fuera del repositorio** (carpeta temporal de la sesión) y se borra al terminar.
- **No inventes datos.** Si falta o es dudoso fecha, valor, estado, forma de pago, paciente o si es un plan, **pregunta antes de registrar**. Un **abono se registra como abono**, nunca como pago total.
- **Excel cerrado.** Si el archivo está abierto en Excel, no lo modifiques: pide a Lizbany que lo cierre (guardando lo que tenga) y espera.
- **Respaldo siempre**, y si la verificación falla, **restaura el respaldo** y avísale.
- **Precios vigentes** (confirmados el 2026-10-06): consulta **$110.000**, primera consulta o diagnóstico **$90.000**, paquete de 4 consultas **$380.000** (un plan con diagnóstico y paquete suma **$470.000**). Reafírmalos con ella en cada registro: el registrador pregunta si un valor cobrado no coincide.
- **Cómo se registra un paquete:** el valor completo va en "Valor cobrado" de la **primera** fila del paquete; las consultas 2 a 4 llevan cobrado 0. Un pago posterior se registra como **fila nueva** con la fecha en que se recibió.
- **Semana de lunes a domingo**, según la fecha de cada fila. Lizbany envía los datos los **viernes** (lo ocurrido desde el viernes anterior). Si atiende sábados o domingos, esas sesiones entran el viernes siguiente y actualizan su semana.

## Flujo del ciclo

1. **Pide los datos** si Lizbany aún no los envió, con este mensaje tipo (puede escribirlo con sus palabras; no tiene que ser perfecto):

   ```
   Viernes [fecha]. Desde el [fecha del último registro].

   Sesiones y pagos:
   1) [ID o paciente] | [fecha] | [tipo] | [modalidad] | cobrado [$] | recibido [$] | [estado] | [forma de pago]
   2) ...

   Pacientes nuevos o cambios de estado: [ID: nuevo / dejó de ser activo / adquirió plan]
   Próximas consultas: [ID: fecha], ...
   Sin movimientos: [sí/no]
   ```

   Antes de empezar, comprueba que Excel esté cerrado y, si quieres saber hasta qué fecha llega el registro, mira la última fecha de la hoja Pagos (solo lectura).

2. **Arma el JSON** del envío (esquema abajo) en una carpeta temporal fuera del repositorio. Usa fechas `AAAA-MM-DD`. Resuelve tú el paciente por ID o nombre; el registrador guarda el nombre oficial de la hoja Pacientes.

3. **Valida sin escribir:**

   ```bash
   powershell -NoProfile -ExecutionPolicy Bypass -File ".claude/skills/control-semanal-terapias/scripts/registrar-semana.ps1" -Path "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx" -Datos "<ruta del json>" -SoloValidar
   ```

   - Código **0**: todo claro. Pasa al paso 4.
   - Código **2**: hay líneas `PREGUNTA|...`. **No se escribió nada.** Tradúcelas a preguntas sencillas para Lizbany (por ID), espera sus respuestas, corrige el JSON y vuelve a validar. Agrega `"precio_confirmado": true` o `"duplicado_confirmado": true` a una fila **solo después de que ella lo confirme**.
   - Código **3**: error (archivo abierto, ruta, etc.). Explícaselo y no sigas.

4. **Registra** (mismo comando sin `-SoloValidar`). Crea el respaldo en `CUADRO CONTROL/respaldos/..._antes-registro.xlsx` (conserva los 4 más recientes), escribe en Pagos, Pacientes y Seguimiento, recalcula y guarda. Debe terminar con `RESULTADO|REGISTRO_OK|celdas con error: 0`.

5. **Verifica y arma el resumen** (solo lee el archivo):

   ```bash
   python ".claude/skills/control-semanal-terapias/scripts/verificar-y-resumir.py" "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx" --hoy AAAA-MM-DD
   ```

   Si termina con código 1, **restaura el respaldo** (cópialo sobre el archivo), avisa a Lizbany qué falló y no entregues el resumen. Si todo está bien, entrega el resumen tal cual sale (semana anterior cerrada y semana en curso parcial, saldos por ID).

6. **Cierra:** borra el JSON temporal, confirma que `git status` no muestra `CUADRO CONTROL/` y recuérdale que puede abrir el Excel para ver la hoja **Panel** (gráficos que se actualizan solos).

## Esquema del JSON (ejemplo ficticio)

```json
{
  "pacientes": [
    { "id": "P901", "nombre": "Persona Ficticia", "inicio": "2026-10-01", "modalidad": "Plan mensual", "estado": "Activo", "notas": "adquirió plan" },
    { "id": "P001", "estado": "Inactivo" }
  ],
  "pagos": [
    { "fecha": "2026-10-01", "paciente": "P901", "tipo": "Consulta 1 de paquete", "modalidad": "Plan 4 consultas",
      "cobrado": 380000, "recibido": 190000, "estado": "Abono recibido", "forma_pago": "Llave bancolombia", "observaciones": "abono del 50 %" },
    { "fecha": "2026-10-02", "paciente": "P001", "tipo": "Consulta individual", "modalidad": "Individual",
      "cobrado": 110000, "recibido": 110000, "estado": "Pagado", "forma_pago": "Nequi" }
  ],
  "seguimiento": [
    { "paciente": "P901", "modalidad": "Plan mensual", "inicio": "2026-10-01", "incluidas": 4, "total_plan": 380000,
      "realizadas": 1, "ultima": "2026-10-01", "proxima": "2026-10-08" }
  ]
}
```

- **estado**: `Pagado`, `Pago pendiente` o `Abono recibido`. **modalidad**: `Individual`, `Inicial` o `Plan 4 consultas` (la lista sale de la hoja Hoja1). **forma_pago**: `Nequi`, `Llave bancolombia` u otra.
- **tipo**: empieza por "Consulta" para contar como sesión (`Consulta diagnóstica`, `Consulta individual`, `Consulta 1 de paquete`, `Consulta 2 de paquete / abono`...). Un pago posterior sin sesión (por ejemplo, un abono) puede llevar otro tipo, y suma ingresos pero no sesiones.
- En **Pacientes**, `modalidad` usa la lista de esa hoja (`Consulta individual`, `Plan mensual`, `Inicial`) y `estado` es `Activo` o `Inactivo`.
- Cualquier bloque puede omitirse. Si no hay nada que registrar, la semana es "sin movimientos": no se modifica el archivo, pero sí se entrega el resumen (paso 5).

## Primera ejecución: puesta al día

La spec cerró la tarea 27 sin una corrida con datos reales porque esos datos los tiene Lizbany. La **primera vez** que ella abra el chat:

1. Hay que registrar **todo desde el 16/09/2026 (el último registro es del 15/09) hasta el domingo 04/10/2026.** Pídele esas sesiones y pagos, por tandas si son muchos.
2. Revisa en Seguimiento las "próximas consultas" ya vencidas y actualiza consultas realizadas con sus respuestas.
3. Al entregar el primer resumen, **pídele que confirme el formato** (semana anterior cerrada y semana en curso parcial, saldos por ID). Es la casilla pendiente del procedimiento.
4. Pregúntale qué mes quiere ver en la hoja **Resumen mensual** (la celda B3 muestra hoy septiembre): ese cambio lo decide ella.
5. Pregúntale si el paciente sin plan que aparece en **Seguimiento** debe quedarse ahí o salir (esa hoja es solo para pacientes con plan); no lo borres sin su respuesta.
6. Pídele que abra la pestaña **Panel** y diga si los gráficos se leen bien (tarea 26 pendiente de su aprobación).
7. Desde entonces, el ciclo sigue **cada viernes** (el siguiente es el 09/10/2026) y se anota en la bitácora de la tarea 29 de `specs/plan-marketing-redes/tasks.md` **sin nombres ni datos de pacientes**.

## Archivos del skill

- `scripts/registrar-semana.ps1`: valida (devuelve preguntas) y registra con Excel por automatización COM, conservando fórmulas, listas desplegables, formato condicional y gráficos. No uses `openpyxl` para escribir en este archivo: borra la validación avanzada de la hoja Pagos y los gráficos del Panel.
- `scripts/verificar-y-resumir.py`: 12 verificaciones del archivo y el resumen semanal sin nombres.
