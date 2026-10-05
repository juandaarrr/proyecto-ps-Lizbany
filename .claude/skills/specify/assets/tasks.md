# Plan de Tareas: <Nombre de la feature>

> Deriva de `requirements.md` y `design.md` (ambos aprobados). Cada tarea es una unidad de trabajo pequeña, verificable y trazable a un requisito. La **Bitácora** de cada tarea se llena durante la implementación y registra qué se hizo y por qué.

## Cómo usar este documento

- **Estados:** `[ ]` pendiente · `[~]` en progreso · `[x]` hecha · `[!]` bloqueada.
- Trabaja una tarea a la vez, en orden. No marques `[x]` sin cumplir su **Criterio de terminado**.
- Al empezar, pasa la tarea a `[~]`. Al cerrar, completa su **Bitácora** (resultado y decisiones) y pasa a `[x]`.
- Registra en la Bitácora toda decisión que no estaba en el diseño: qué se decidió, por qué y qué alternativas se descartaron.
- Si una decisión cambia un requisito o el diseño, anótala también en **Cambios a la spec** y propón la edición de `requirements.md` o `design.md` para aprobación del usuario.

## Resumen de avance

| Fase | Tareas | Hechas |
|---|---|---|
| 1. <Fase> | <n> | 0 |
| 2. <Fase> | <n> | 0 |

## Tareas

### Fase 1: <Nombre de la fase>

- [ ] **1. <Título de la tarea, en imperativo>**
  - **Qué:** <resultado concreto que debe existir al terminar>.
  - **Requisitos:** <Req. N.M, ...>
  - **Diseño:** <componente o sección de `design.md`>.
  - **Depende de:** <ninguna | tarea N>.
  - **Criterio de terminado:** <comprobación objetiva: prueba que pasa, comportamiento observable, comando que se ejecuta>.
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | <AAAA-MM-DD> | <Hecho \| Decisión \| Bloqueo \| Cambio> | <Qué ocurrió. En una *Decisión*: qué se eligió, por qué y alternativas descartadas.> |

- [ ] **2. <Título de la tarea>**
  - **Qué:** ...
  - **Requisitos:** ...
  - **Diseño:** ...
  - **Depende de:** tarea 1.
  - **Criterio de terminado:** ...
  - **Bitácora:** _sin registros_

### Fase 2: <Nombre de la fase>

- [ ] **3. <Título de la tarea>**
  - **Qué:** ...
  - **Requisitos:** ...
  - **Diseño:** ...
  - **Depende de:** ...
  - **Criterio de terminado:** ...
  - **Bitácora:** _sin registros_

## Cobertura de requisitos

Todo criterio de aceptación debe estar cubierto por al menos una tarea.

| Requisito | Tareas |
|---|---|
| Req. 1 | 1, 2 |
| Req. 2 | 3 |

## Decisiones transversales

Decisiones que afectan a varias tareas o a toda la feature.

| Fecha | Decisión | Motivo | Tareas afectadas |
|---|---|---|---|
| <AAAA-MM-DD> | <qué se decidió> | <por qué> | <N, M> |

## Cambios a la spec

Ajustes a `requirements.md` o `design.md` surgidos durante la implementación.

| Fecha | Documento | Cambio propuesto | Estado |
|---|---|---|---|
| <AAAA-MM-DD> | <requirements \| design> | <qué cambia y por qué> | <Pendiente \| Aprobado \| Descartado> |
