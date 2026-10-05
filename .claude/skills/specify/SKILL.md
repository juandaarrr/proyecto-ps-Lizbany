---
name: specify
description: Crea specs de features con el enfoque Requirements-First (estilo Kiro) - primero requirements.md con requisitos EARS, luego design.md y por último tasks.md (plan de tareas que sirve de bitácora de implementación), con aprobación del usuario entre cada fase. Úsalo siempre que el usuario pida especificar, definir, planificar o documentar una feature nueva, escribir requisitos, un diseño técnico o una lista de tareas, o diga "spec", "specify", "requirements", "design doc" o "tasks", aunque no nombre el skill. También es el paso que sigue a brainstorming cuando la feature es arquitectónica. No implementa código ni cubre bugfixes.
---

# Specify (Requirements-First)

Convierte una idea de feature en tres documentos aprobados, en este orden: **requirements.md**, **design.md** y **tasks.md**. Cada documento es una puerta de aprobación: el usuario valida antes de pasar al siguiente. Así el diseño se deriva de comportamiento ya acordado y no de suposiciones, las tareas se derivan del diseño, y los desacuerdos se detectan cuando corregirlos es barato.

Alcance: requirements, design y el plan de tareas (`tasks.md`). Este skill planifica pero no implementa: no escribas código de la feature. `tasks.md` es además el registro de la implementación, que se llena a medida que se ejecutan las tareas.

Este skill se puede usar solo o encadenado tras `brainstorming` (ver "Entrada desde brainstorming").

Escribe los documentos en español.

## Ubicación

```
specs/<nombre-feature>/
├── requirements.md
├── design.md
└── tasks.md
```

`<nombre-feature>` va en kebab-case (ej. `carrusel-instagram`). Una spec por feature. Si la carpeta ya existe, léela y continúa/edita en vez de sobrescribir.

## Flujo

### Entrada desde brainstorming
Si `brainstorming` ya se ejecutó en esta conversación, su entendimiento acordado y su diseño aprobado son la fuente: **no repitas las preguntas ya respondidas**. Pasa su intención y restricciones a la Introducción y los Supuestos de `requirements.md`, y sus decisiones y alternativas descartadas a `design.md`. Si el diseño conversacional contradice algo que el usuario dice ahora, avisa y pregunta antes de escribir. Tu aprobación por documento sigue siendo obligatoria: la aprobación del diseño conversacional no cuenta como aprobación de `requirements.md`.

### 1. Entender la idea
Lee la petición del usuario y el contexto relevante del proyecto (archivos existentes, convenciones). Haz como máximo 2-3 preguntas si falta algo que cambie los requisitos (quién usa la feature, qué problema resuelve, límites). Si es razonable inferirlo, infiere y deja los supuestos explícitos en el documento.

### 2. Requirements
Copia `templates/requirements.md` a `specs/<feature>/requirements.md` y complétalo. Reglas:

- Estructura: introducción, glosario si hace falta, y requisitos numerados, cada uno con una **historia de usuario** y **criterios de aceptación** en EARS.
- Formato EARS: `WHEN [condición/evento] THE SYSTEM SHALL [comportamiento]`. Variantes útiles: `IF [condición no deseada] THEN THE SYSTEM SHALL ...` para errores y `WHILE [estado] THE SYSTEM SHALL ...` para comportamiento continuo.
- Cada criterio debe ser testeable: alguien debe poder decir objetivamente si se cumple. Evita "rápido", "fácil", "adecuado"; usa cifras o resultados observables.
- Incluye casos límite y de error, no solo el camino feliz.
- Registra lo que queda **fuera de alcance** para evitar que la feature crezca en silencio.

Al terminar, resume los requisitos en pocas líneas y **pide aprobación explícita** (aprobar, editar o pedir cambios). No avances al diseño sin ella.

### 2b. Análisis de requisitos (opcional)
Ofrécelo cuando la feature sea compleja o el dominio sensible; hazlo siempre si el usuario lo pide. Revisa `requirements.md` buscando:
- **Inconsistencias**: requisitos que se contradicen.
- **Ambigüedades**: términos vagos o criterios no medibles.
- **Huecos**: errores, permisos, estados vacíos o casos límite sin cubrir.

Presenta los hallazgos en una lista corta con la corrección propuesta para cada uno y aplica los que el usuario acepte.

### 3. Design
Solo tras aprobar los requisitos. Copia `templates/design.md` a `specs/<feature>/design.md` y complétalo. El diseño debe trazarse a los requisitos: referencia los números (ej. "cubre Req. 2 y 3"). Cubre: visión general y decisiones de arquitectura, flujo de datos (diagrama Mermaid cuando ayude), componentes e interfaces, modelos de datos, manejo de errores y estrategia de pruebas.

Antes de decidir, revisa el código/estructura existente para encajar con lo que ya hay. Si una decisión tiene alternativas reales, anota por qué elegiste una. Si el diseño revela que falta o sobra un requisito, avisa y actualiza `requirements.md` con aprobación del usuario.

Al terminar, resume el diseño y **pide aprobación explícita**.

### 4. Tasks
Solo tras aprobar el diseño. Copia `assets/tasks.md` a `specs/<feature>/tasks.md` y complétalo. Reglas:

- Deriva las tareas de los componentes y el manejo de errores de `design.md`, no de ideas nuevas. Si falta algo, avisa y propón el cambio al diseño.
- Cada tarea es pequeña (un resultado verificable), va en orden de dependencia e indica los **requisitos** que cumple (ej. "Req. 2.3") y el **componente** del diseño que toca.
- Cada tarea tiene un **criterio de terminado** objetivo (prueba, comportamiento observable o comando). Incluye las pruebas de la "Estrategia de pruebas" como tareas o como parte del criterio de la tarea que prueban.
- Rellena la **Cobertura de requisitos**: todo criterio de aceptación debe quedar cubierto por al menos una tarea. Si alguno no lo está, añade la tarea o señala el hueco.
- Deja la **Bitácora** de cada tarea vacía (`_sin registros_`): se llena al implementar, no al planificar.

Al terminar, resume las fases y el número de tareas y **pide aprobación explícita**.

#### Bitácora durante la implementación
`tasks.md` es el registro vivo de la implementación. Quien ejecute una tarea (tú o el usuario):
- La pasa a `[~]` al empezar y a `[x]` solo cuando cumple su criterio de terminado.
- Añade a su Bitácora un registro por cada hecho relevante, bloqueo o decisión no prevista (qué se eligió, por qué y qué se descartó).
- Si una decisión cambia un requisito o el diseño, la anota en "Cambios a la spec" y propone la edición del documento al usuario antes de aplicarla.

### 5. Cierre
Con los tres documentos aprobados, indica las rutas de los archivos y que la spec está lista para implementarse siguiendo `tasks.md`. Si venías de `brainstorming`, devuelve el control.

## Iteración
Los documentos se pueden refinar después: si cambia `requirements.md`, revisa `design.md` y `tasks.md` y propón los ajustes para que sigan alineados (cobertura de requisitos incluida). Las tareas ya hechas no se reescriben: añade una tarea nueva o un registro en la Bitácora. No cambies de enfoque a mitad de una spec (Design-First); si el usuario lo necesita, crea una spec nueva.
