---
name: specify
description: Crea specs de features con el enfoque Requirements-First (estilo Kiro) - primero requirements.md con requisitos EARS, luego design.md, con aprobación del usuario entre cada fase. Úsalo siempre que el usuario pida especificar, definir, planificar o documentar una feature nueva, escribir requisitos o un diseño técnico, o diga "spec", "specify", "requirements" o "design doc", aunque no nombre el skill. No cubre tareas de implementación ni bugfixes.
---

# Specify (Requirements-First)

Convierte una idea de feature en dos documentos aprobados, en este orden: **requirements.md** y luego **design.md**. Cada documento es una puerta de aprobación: el usuario valida antes de pasar al siguiente. Así el diseño se deriva de comportamiento ya acordado y no de suposiciones, y los desacuerdos se detectan cuando corregirlos es barato.

Alcance actual: solo requirements y design. No generes lista de tareas ni código de implementación; si el usuario las pide, dile que quedan fuera por ahora.

Escribe los documentos en español.

## Ubicación

```
specs/<nombre-feature>/
├── requirements.md
└── design.md
```

`<nombre-feature>` va en kebab-case (ej. `carrusel-instagram`). Una spec por feature. Si la carpeta ya existe, léela y continúa/edita en vez de sobrescribir.

## Flujo

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

### 4. Cierre
Con ambos documentos aprobados, indica las rutas de los archivos y que el siguiente paso (tareas de implementación) aún no está cubierto por este skill.

## Iteración
Los documentos se pueden refinar después: si cambia `requirements.md`, revisa `design.md` y propón los ajustes para que sigan alineados. No cambies de enfoque a mitad de una spec (Design-First); si el usuario lo necesita, crea una spec nueva.
