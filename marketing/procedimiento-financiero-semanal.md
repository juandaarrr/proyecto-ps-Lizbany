# Procedimiento semanal del control financiero de terapias

> Spec: `specs/plan-marketing-redes/` (Req. 10, tarea 25). Este documento **no contiene datos de pacientes**: solo el procedimiento. Los datos viven en `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx`, que está fuera de git.

## Qué se logra

Cada viernes Lizbany envía por el chat lo ocurrido en su consulta. Claude lo registra en el archivo de control, le pregunta lo que no entienda, y el archivo se actualiza solo: hojas de seguimiento, resumen y una hoja **Panel** con gráficos. Lizbany recibe además un resumen de lo que **ingresó** por sus sesiones, para llevar el seguimiento de sus entradas de capital. No es contabilidad formal ni cobra a los pacientes.

## Decisiones (Lizbany, 2026-10-06)

- [x] **Día de entrega:** cada **viernes**.
- [x] **Cómo entrega los datos:** por el **chat con Claude**; Claude los registra en el archivo.
- [x] **Aclaraciones:** si Claude no entiende algo o no sabe en qué hoja o campo va un dato, **pregunta antes de registrarlo**.
- [x] **Semana:** de **lunes a domingo**.
- [x] **Gráficos:** en una hoja **Panel** dentro del mismo Excel.
- [x] **Regla de abonos:** un abono se registra como abono y nunca se asume como pago total.
- [ ] **Formato del resumen:** el de la sección "Resumen que se entrega" (ahora con semana en curso parcial y semana anterior cerrada). Se confirma en la primera corrida de prueba.

## Precios vigentes (referencia)

Confirmados por Lizbany el 2026-10-06. **Claude los reafirma contigo en cada registro semanal**: si un valor cobrado no coincide con esta lista, pregunta antes de registrarlo.

| Concepto | Valor |
|---|---|
| Consulta | $110.000 |
| Primera consulta o diagnóstico | $90.000 |
| Paquete de 4 consultas | $380.000 |
| Plan con diagnóstico y paquete | $470.000 ($90.000 + $380.000) |

## Cómo está organizado el archivo

| Hoja | Para qué sirve |
|---|---|
| **Pacientes** | Pacientes existentes, con fecha de inicio, si están activos (Lizbany avisa cuando uno deja de serlo) y notas, como si adquirió o no un plan |
| **Pagos** | Registro semana a semana de las sesiones y los pagos |
| **Seguimiento** | Solo pacientes con plan: cómo va el pago, cuánto debe y si ya pagó todo |
| **Resumen mensual** | Ingresos, cobros (lo que debió entrar) y saldos pendientes por paciente |
| **Resumen semanal** | Una fila por semana, calculada con fórmulas |
| **Panel** | Gráficos que se actualizan solos |

El saldo de un paciente **sin plan** es lo cobrado menos lo recibido. El saldo de uno **con plan** es el total del plan menos lo pagado.

## Calendario

| Momento | Quién | Qué |
|---|---|---|
| Antes del viernes | Lizbany | Cierra el archivo de Excel (no debe estar abierto) y reúne las sesiones y pagos desde el viernes anterior |
| Viernes | Lizbany | Envía por el chat el mensaje tipo |
| Viernes | Claude | Hace las preguntas necesarias, registra, verifica y entrega el resumen |

## Qué informa Lizbany

Para cada sesión o pago que se vaya a registrar en la hoja **Pagos**:

| Dato | Ejemplo de valor permitido |
|---|---|
| Fecha | día en que ocurrió la sesión (o en que se recibió el pago, si es un pago posterior) |
| Paciente | ID (P001...) o nombre; el resumen siempre usará el ID |
| Tipo de consulta | diagnóstica, individual, 1 de paquete, 2 de paquete / abono... |
| Modalidad | Inicial, Individual, Plan 4 consultas |
| Valor cobrado | monto cobrado por la sesión o el paquete |
| Valor recibido | monto que **efectivamente** entró |
| Estado de pago | Pagado, Pago pendiente o Abono recibido |
| Forma de pago | Nequi, Llave Bancolombia u otra |
| Observaciones | opcional |

Además, para actualizar el resto del archivo:
- **Pacientes nuevos** o cambios de estado (por ejemplo, "dejó de ser activo"), y si adquirió o no un plan.
- **Seguimiento:** la fecha de la próxima consulta de cada paciente con plan.

### Mensaje tipo (copiar y completar)

```
Viernes [fecha]. Desde el viernes [fecha anterior].

Sesiones y pagos:
1) [ID o paciente] | [fecha] | [tipo] | [modalidad] | cobrado [$] | recibido [$] | [estado] | [forma de pago]
2) ...

Pacientes nuevos o cambios de estado: [ID: nuevo / dejó de ser activo / adquirió plan]
Próximas consultas: [ID: fecha], ...
Sin movimientos esta semana: [sí/no]
```

No tiene que ser perfecto: si algo falta o no queda claro, Claude pregunta.

## Qué hace Claude (el ciclo)

1. **Comprueba el archivo:** que exista y no esté abierto en otro programa.
2. **Respaldo:** copia con fecha en `CUADRO CONTROL/respaldos/` y conserva las 4 más recientes.
3. **Pregunta lo que no esté claro** antes de registrar nada: datos faltantes, dudosos, posibles duplicados o dudas sobre en qué hoja o campo va un dato.
4. **Registra** las filas en **Pagos**, y actualiza **Pacientes** y **Seguimiento** (consultas realizadas y pendientes, última y próxima consulta, total pagado, saldo).
5. **Actualiza el Resumen semanal.** Es una fila por semana calculada con fórmulas; el **Panel** se recalcula solo.
6. **Verifica:** que fórmulas, listas desplegables y gráficos sigan funcionando, y que la suma de ingresos semanales del mes coincida con "Ingresos recibidos en el mes" de **Resumen mensual**. Si algo no coincide, restaura la copia y avisa.
7. **Entrega el resumen** a Lizbany.

### Herramientas

Todo este ciclo está automatizado en el skill del proyecto **`control-semanal-terapias`** (`.claude/skills/control-semanal-terapias/`): un registrador que valida y escribe en el Excel sin perder fórmulas, listas ni gráficos, un verificador con 12 comprobaciones y el generador del resumen. Lizbany solo tiene que abrir un chat con Claude en este proyecto y enviar sus datos con el mensaje tipo; Claude sigue la guía del skill.

**Primera vez:** hay que poner el archivo al día desde el 16/09/2026 hasta el domingo 04/10/2026; desde el viernes 09/10/2026 se continúa cada viernes.

## Reglas

- **Ingreso = "Valor recibido".** Lo cobrado y no recibido no cuenta como ingreso; aparece como "pendiente por cobrar".
- **La semana va de lunes a domingo, según la fecha de cada fila.** Si un pago llega después de la sesión, se registra como **fila nueva** con la fecha en que se recibió.
- **Fin de semana:** si Lizbany atiende sábados o domingos, esas sesiones entran en el envío del viernes siguiente y **actualizan** la semana a la que pertenecen (las fórmulas la recalculan). Por eso el resumen del viernes muestra la semana en curso como **parcial** y la anterior como **cerrada**.
- **Abono ≠ pago total.** Se registra "Abono recibido" por el monto real; el saldo lo calcula el archivo.
- **No se inventan datos.** Si falta fecha, valor, estado o forma de pago, Claude pregunta y espera la respuesta.
- **Precios:** Claude contrasta cada valor cobrado con la lista de precios vigentes y, si no coincide (por ejemplo, un descuento o una tarifa distinta), pregunta antes de registrarlo.
- **Posible duplicado** (misma fecha, paciente y valor que una fila existente): Claude pide confirmación antes de agregarla.
- **Archivo ausente o abierto:** Claude no modifica nada y avisa.
- **Semana sin movimientos:** se registra la semana en ceros con la nota "sin movimientos" y se entrega igual el resumen.
- **Si la verificación falla:** se restaura la copia de respaldo, se avisa y no se entrega un resumen hasta corregirlo.

## Panel (gráficos)

Hoja dentro del mismo Excel, que se actualiza sola al registrar datos:

1. Ingresos recibidos por semana (últimas 12).
2. Ingresos frente a cobros por mes.
3. Saldos pendientes por paciente (por ID).
4. Ingresos por forma de pago.
5. Sesiones por tipo.

## Resumen que se entrega

Se entrega en el chat y queda reflejado en el archivo (**Resumen semanal** y **Panel**). **No incluye nombres de pacientes**: los saldos pendientes se muestran por ID.

Ejemplo ilustrativo (las cifras no son reales):

```
RESUMEN FINANCIERO — viernes 00/00

SEMANA ANTERIOR (cerrada, 00/00 al 00/00)
  Sesiones realizadas: 4  (diagnóstica: 1 | individual: 2 | paquete: 1)
  Cobros registrados:         $ 000.000
  Ingresos recibidos:         $ 000.000
  Pendiente por cobrar:       $ 000.000

SEMANA EN CURSO (parcial, lunes a viernes, 00/00 al 00/00)
  Sesiones realizadas: 3  (diagnóstica: 0 | individual: 3 | paquete: 0)
  Cobros registrados:         $ 000.000
  Ingresos recibidos:         $ 000.000
  Pendiente por cobrar:       $ 000.000

Ingresos por forma de pago (semana en curso): Nequi $ 000.000 | Llave Bancolombia $ 000.000 | Otras $ 0
Acumulado del mes:          $ 000.000
Variación vs. semana anterior: +$ 000.000 (+00 %)

Saldos pendientes por paciente: P001 $ 000.000 | P002 $ 000.000
Observaciones: [abonos, pagos tardíos, datos que se corrigieron o se preguntaron]
```

## Privacidad

- Los datos de pacientes y pagos **no salen** de la carpeta `CUADRO CONTROL/`, que está excluida de git (`.gitignore`) y no se copia a la hoja de seguimiento de marketing ni a esta carpeta `marketing/`.
- Este archivo y las bitácoras de la spec usan solo identificadores (P001...) y nunca nombres.
- La carpeta está dentro de OneDrive, por lo que se sincroniza con la nube de Microsoft aunque git la ignore.
