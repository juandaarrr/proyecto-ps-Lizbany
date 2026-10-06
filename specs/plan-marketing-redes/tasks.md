# Plan de Tareas: Plan de marketing en redes sociales (Lizbany Arango)

> Deriva de `requirements.md` y `design.md` (ambos aprobados). Cada tarea es una unidad de trabajo pequeña, verificable y trazable a un requisito. La **Bitácora** de cada tarea se llena durante la implementación y registra qué se hizo y por qué.

## Cómo usar este documento

- **Estados:** `[ ]` pendiente · `[~]` en progreso · `[x]` hecha · `[!]` bloqueada.
- Trabaja una tarea a la vez, en orden. No marques `[x]` sin cumplir su **Criterio de terminado**.
- Al empezar, pasa la tarea a `[~]`. Al cerrar, completa su **Bitácora** (resultado y decisiones) y pasa a `[x]`.
- Registra en la Bitácora toda decisión que no estaba en el diseño: qué se decidió, por qué y qué alternativas se descartaron.
- Si una decisión cambia un requisito o el diseño, anótala también en **Cambios a la spec** y propón la edición de `requirements.md` o `design.md` para aprobación del usuario.
- **Quién hace cada tarea:** las marcadas **(Lizbany)** necesitan una decisión, una gestión o una acción de ella. Las demás las puede preparar Claude para que ella las revise.
- Las tareas 14, 17, 20 y 29 son **ciclos de varias semanas**: se registran semana a semana en su Bitácora.
- La **Fase 6 (control financiero)** corre en paralelo a las demás: sus tareas 22 a 27 pueden hacerse desde ya, antes de la semana 1, y la tarea 29 se repite cada viernes junto con el ciclo de marketing.
- **Datos sensibles:** el archivo `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx` tiene nombres de pacientes y pagos reales. Ninguna bitácora ni documento de esta spec debe copiar nombres ni datos de pacientes; se usan los identificadores (P001...).

## Resumen de avance

| Fase | Tareas | Hechas |
|---|---|---|
| 1. Preparación del sistema | 8 | 0 |
| 2. Producción y lanzamiento | 5 | 0 |
| 3. Mes 1: Ansiedad (semanas 1 a 4) | 3 | 0 |
| 4. Mes 2: Autoexigencia (semanas 5 a 8) | 3 | 0 |
| 5. Mes 3: Relaciones y cambios (semanas 9 a 12) y cierre | 2 | 0 |
| 6. Control financiero semanal (en paralelo) | 8 | 4 |

## Tareas

### Fase 1: Preparación del sistema

- [ ] **1. Crear la carpeta `marketing/` y el checklist de ética**
  - **Qué:** la carpeta `marketing/` y el archivo `marketing/checklist-etica.md` con los 8 puntos de sí o no del diseño, redactados de la forma más conservadora hasta que llegue la revisión de la tarea 2.
  - **Requisitos:** Req. 2.5, 5.1, 5.2, 5.3, 5.4, 5.7, 6.1 y requisito no funcional de accesibilidad.
  - **Diseño:** Checklist de ética.
  - **Depende de:** ninguna.
  - **Criterio de terminado:** el archivo existe, tiene los 8 puntos (sin diagnóstico ni promesas, sin testimonios, sin autodiagnóstico, tono no alarmista, etapa y CTA coherentes, marca y mensaje de WhatsApp, subtítulos y contraste de 4.5:1, revisión del Colegio de Psicólogos) y Lizbany lo ha leído y aprobado.
  - **Bitácora:** _sin registros_

- [ ] **2. Gestionar la revisión de publicidad con el Colegio Colombiano de Psicólogos (Lizbany)**
  - **Qué:** una consulta sobre las reglas de publicidad aplicables (Ley 1090 de 2006) y sus conclusiones por escrito. Si traen restricciones, se actualiza el checklist de la tarea 1.
  - **Requisitos:** Req. 5.6, 5.7.
  - **Diseño:** Checklist de ética (punto 8); Riesgos y decisiones pendientes.
  - **Depende de:** ninguna. Debe iniciarse al menos 7 días antes de publicar la primera pieza.
  - **Criterio de terminado:** la fecha de la revisión y sus conclusiones quedan anotadas en la pestaña Meses (o en un archivo `marketing/revision-colpsic.md` si la hoja aún no existe), y el checklist y el banco de piezas están ajustados a ellas.
  - **Bitácora:** _sin registros_

- [ ] **3. Fijar los parámetros pendientes (Lizbany)**
  - **Qué:** una nota `marketing/parametros.md` con: fecha de inicio de la semana 1, seguidores y pacientes actuales, si la hoja será en la nube o local, el tope de gasto de la pauta (o "sin pauta"), quién responde WhatsApp y su plazo, la experiencia de Lizbany sobre cuántas conversaciones terminan en cita, y los **precios vigentes** de la consulta (resolviendo la diferencia entre el archivo de control y `PROYECTO MARCA PERSONAL.docx`).
  - **Requisitos:** Req. 1.1, 1.2, 7.3, 9.2, 7.4 y las preguntas abiertas de `requirements.md`.
  - **Diseño:** Riesgos y decisiones pendientes; Pauta pequeña.
  - **Depende de:** ninguna.
  - **Criterio de terminado:** el archivo tiene los 7 datos y cada uno tiene un valor concreto (o "no aplica" con motivo).
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | 2026-10-06 | Hecho | **Precios vigentes confirmados por Lizbany:** consulta $110.000; primera consulta o diagnóstico $90.000; paquete de 4 consultas $380.000 (un plan con diagnóstico y paquete suma $470.000). Los valores de `PROYECTO MARCA PERSONAL.docx` ($100.000 y $350.000) están desactualizados. Se actualizaron `requirements.md` (Supuestos y Req. 7.3) y `design.md`. Quedan pendientes los otros 6 datos: fecha de inicio, seguidores y pacientes actuales, hoja en la nube o local, tope de pauta, quién responde WhatsApp y experiencia de conversión. |

- [ ] **4. Crear la hoja de seguimiento**
  - **Qué:** una hoja de cálculo con las pestañas Piezas, Semanas, Meses y Pauta y los campos del modelo de datos del diseño. El campo `etapa` de Piezas es obligatorio, `checklist_ok` lleva sí/no, y las métricas no disponibles se anotan "n/d" con su causa. Incluye la meta (6 a 10 pacientes, 2 a 3 conversaciones por semana) y la tasa de conversión de 0.25 como hipótesis. No tiene columnas para nombres ni datos personales.
  - **Requisitos:** Req. 1.1, 1.2, 1.5, 2.1, 2.5, 8.1, 8.5, 8.6, 9.5 y requisito no funcional de privacidad.
  - **Diseño:** Hoja de seguimiento; Modelos de datos.
  - **Depende de:** tarea 3.
  - **Criterio de terminado:** las 4 pestañas existen con todas sus columnas, el enlace está guardado en `marketing/parametros.md` y Lizbany puede abrir y editar la hoja desde su celular.
  - **Bitácora:** _sin registros_

- [ ] **5. Redactar la guía del perfil (bio y destacados)**
  - **Qué:** `marketing/guia-perfil.md` con el texto de la bio (una frase de a quién ayuda y qué enfoque usa, más el enlace de WhatsApp con "Hola Liz, quiero agendar una cita."), el contenido de los 4 destacados (cómo son las sesiones, precios, cómo agendar, preguntas frecuentes) y el aviso de que no reemplaza la atención de urgencias.
  - **Requisitos:** Req. 5.5, 6.2, 7.1, 7.2, 7.3.
  - **Diseño:** Perfil convertidor.
  - **Depende de:** tareas 1 y 3.
  - **Criterio de terminado:** el archivo tiene la bio, los 4 destacados con sus textos, los precios vigentes confirmados en la tarea 3, la modalidad virtual de 60 minutos y el aviso de urgencias; Lizbany lo aprobó.
  - **Bitácora:** _sin registros_

- [ ] **6. Redactar las plantillas y el protocolo de WhatsApp**
  - **Qué:** `marketing/plantillas-whatsapp.md` con: respuesta a conversación nueva que propone horario, recordatorio de seguimiento, respuesta ante crisis con la línea de emergencia local, respuesta a comentarios negativos o de autodiagnóstico, y la regla de no pedir ni aceptar datos clínicos antes de la consulta.
  - **Requisitos:** Req. 6.2, 7.4, 7.5, 7.6, 7.7 y requisito no funcional de privacidad.
  - **Diseño:** Protocolo de WhatsApp.
  - **Depende de:** tarea 3.
  - **Criterio de terminado:** el archivo tiene las 4 plantillas y la regla de datos clínicos, la plantilla de crisis incluye la línea de emergencia local verificada por Lizbany, y ella aprobó el tono.
  - **Bitácora:** _sin registros_

- [ ] **7. Redactar el calendario de 12 semanas**
  - **Qué:** `marketing/calendario-12-semanas.md` con las 12 semanas: reel el lunes, carrusel el miércoles, reel el viernes, 2 a 3 historias, el tema foco de cada mes (mes 1 ansiedad, mes 2 autoexigencia, mes 3 relaciones y cambios), y la etapa y el pilar de cada pieza. Incluye el enlace de la hoja.
  - **Requisitos:** Req. 2.1, 3.1, 3.2, 3.3.
  - **Diseño:** Tablero de piezas.
  - **Depende de:** tareas 3 y 4.
  - **Criterio de terminado:** el calendario lista 24 reels y 12 carruseles con etapa y pilar, y por cada mes al menos la mitad de las piezas es del tema foco y hay al menos una pieza de cada uno de los otros dos pilares.
  - **Bitácora:** _sin registros_

- [ ] **8. Preparar las herramientas de apoyo (opcional)**
  - **Qué:** instalar los skills de `SKIILS/` que se vayan a usar (`hook-generator`, `story-reel-scriptwriter`, `caption-writer`, `monthly-content-planner`, `performance-analyst`) copiando el `.skill` (un zip) a `~/.claude/skills/`, y crear el perfil de marca (`brand-profile.md`) una sola vez con voz, público, plataformas, llamados a la acción y palabras prohibidas.
  - **Requisitos:** apoya Req. 2, 3, 4 y 8 (no cumple ninguno por sí solo).
  - **Diseño:** Herramientas de apoyo.
  - **Depende de:** tarea 1.
  - **Criterio de terminado:** cada skill elegido responde a una petición de prueba y el perfil de marca existe; o la bitácora registra que se decidió no usar estas herramientas.
  - **Bitácora:** _sin registros_

### Fase 2: Producción y lanzamiento

- [ ] **9. Hacer el inventario del material existente y asignarlo al calendario**
  - **Qué:** una lista de lo ya producido (`REELS FINALES/`, `VIDEOS/`, `IDEAS PARA REELS #1.docx`, `IDEAS CARRUSEL #1/`, `PUBLICACIÓN 1 a 4`) con su pilar y etapa, asignando al calendario lo que encaje con el tema foco de cada mes y marcando lo que debe ajustarse a la paleta y tipografías vigentes.
  - **Requisitos:** Req. 2.1, 4.3, 6.3.
  - **Diseño:** Tablero de piezas; Arquitectura.
  - **Depende de:** tarea 7.
  - **Criterio de terminado:** cada pieza ya producida aparece en la pestaña Piezas con pilar, etapa y semana asignada (o con la nota "no se usa" y el motivo), y las que usan otra identidad visual quedan marcadas para ajuste.
  - **Bitácora:** _sin registros_

- [ ] **10. Producir el banco inicial de 3 piezas (primera tanda)**
  - **Qué:** al menos 3 piezas terminadas (idealmente 2 reels y 1 carrusel de la semana 1) en una sola sesión de grabación en tanda. Cada una con su etapa, su gancho en los primeros 3 segundos (reels), su invitación a guardar, compartir o comentar, subtítulos y la identidad de marca.
  - **Requisitos:** Req. 2.2, 2.3, 3.4, 3.6, 5.1, 5.2, 5.3, 5.4, 6.1.
  - **Diseño:** Tablero de piezas; Checklist de ética.
  - **Depende de:** tareas 1, 7 y 9.
  - **Criterio de terminado:** 3 piezas con estado `en_banco`, `checklist_ok` = sí y el checklist de ética firmado (todos los puntos en sí) para cada una.
  - **Bitácora:** _sin registros_

- [ ] **11. Aplicar el perfil en Instagram (Lizbany)**
  - **Qué:** convertir la cuenta a profesional si no lo es, publicar la bio con el enlace de WhatsApp y los 4 destacados con precios y el aviso de urgencias, según la guía de la tarea 5.
  - **Requisitos:** Req. 5.5, 7.1, 7.2, 7.3 y el supuesto de cuenta profesional.
  - **Diseño:** Perfil convertidor.
  - **Depende de:** tarea 5.
  - **Criterio de terminado:** la cuenta muestra estadísticas, el perfil visible coincide con la guía y los 4 destacados están publicados.
  - **Bitácora:** _sin registros_

- [ ] **12. Ejecutar la prueba de arranque**
  - **Qué:** la verificación antes de la semana 1 descrita en el diseño.
  - **Requisitos:** Req. 3.4, 5.5, 5.6, 6.2, 7.1, 7.2, 7.3.
  - **Diseño:** Estrategia de pruebas (prueba de arranque).
  - **Depende de:** tareas 2, 10 y 11.
  - **Criterio de terminado:** los cuatro puntos se cumplen y están anotados en la bitácora: (1) el enlace de la bio, abierto desde un celular, abre WhatsApp con el mensaje "Hola Liz, quiero agendar una cita."; (2) existen la bio, los 4 destacados con precios y el aviso de urgencias; (3) el banco tiene al menos 3 piezas con checklist aprobado; (4) la revisión del Colegio de Psicólogos está registrada.
  - **Bitácora:** _sin registros_

- [ ] **13. Ejecutar la prueba del camino a la cita**
  - **Qué:** pedir a 2 personas cercanas (de la edad y el perfil del público) que sigan el recorrido reel → perfil → WhatsApp, y responderles con la plantilla.
  - **Requisitos:** Req. 7.1, 7.2, 7.3, 7.4.
  - **Diseño:** Estrategia de pruebas (prueba del camino a la cita).
  - **Depende de:** tareas 6 y 12.
  - **Criterio de terminado:** las 2 personas llegan a escribir por WhatsApp sin confusión, y se les responde en menos de 24 horas con la plantilla. Los problemas hallados quedan anotados y corregidos en la guía de perfil o en las plantillas.
  - **Bitácora:** _sin registros_

### Fase 3: Mes 1: Ansiedad (semanas 1 a 4)

- [ ] **14. Ejecutar el ciclo semanal de las semanas 1 a 4**
  - **Qué:** por cada semana, el ciclo del diseño: publicar 2 reels y 1 carrusel (lunes, miércoles y viernes) y 2 a 3 historias, derivar al menos una historia de cada reel en los 7 días siguientes, responder los mensajes de WhatsApp en menos de 24 horas, aplicar el protocolo de crisis y de comentarios cuando haga falta, y registrar la semana en la hoja. Cada semana se identifica el reel de mayor alcance, se planea repetir su formato o tema, y se señalan los reels candidatos a carrusel.
  - **Requisitos:** Req. 1.2, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.5, 4.1, 4.2, 5.1, 5.2, 5.3, 5.4, 7.4, 7.5, 7.6, 7.7, 8.1, 8.3, 8.5, 8.6 y requisito no funcional de sostenibilidad.
  - **Diseño:** Tablero de piezas; Checklist de ética; Protocolo de WhatsApp; Hoja de seguimiento; Ciclo de revisión.
  - **Depende de:** tareas 12 y 13.
  - **Criterio de terminado:** la pestaña Semanas tiene las filas de las semanas 1 a 4 completas (o con "n/d" y causa); se publicaron 8 reels y 4 carruseles (o la semana que falló tiene su motivo registrado y se usó el banco); cada pieza tiene etapa y `checklist_ok` = sí; a partir de la semana 2 el banco nunca baja de 3 piezas; cada reel tiene una historia derivada dentro de 7 días; ninguna fila de la hoja contiene datos personales.
  - **Bitácora:** _sin registros_

- [ ] **15. Cronometrar el registro semanal (semanas 1 y 2)**
  - **Qué:** medir cuánto tarda llenar la hoja en las 2 primeras semanas y simplificarla si hace falta. Se hace dentro de la tarea 14.
  - **Requisitos:** Req. 8.2.
  - **Diseño:** Hoja de seguimiento; Estrategia de pruebas (prueba del registro semanal).
  - **Depende de:** tarea 12.
  - **Criterio de terminado:** los tiempos de las semanas 1 y 2 están en la bitácora y ninguno supera 10 minutos; si alguno lo supera, la hoja se simplificó y se midió de nuevo.
  - **Bitácora:** _sin registros_

- [ ] **16. Revisión de la semana 4 y cierre del mes 1**
  - **Qué:** calcular la tasa real de conversaciones que terminaron en cita y compararla con 1 de cada 4; recalcular cuántas conversaciones semanales hacen falta para la meta; revisar el avance del mes; calcular la mediana de alcance de los reels del mes 1 (base para el reel ganador); confirmar o ajustar el tema foco del mes 2.
  - **Requisitos:** Req. 1.3, 3.3, 8.4.
  - **Diseño:** Ciclo de revisión (semana 4 y mensual).
  - **Depende de:** tarea 14.
  - **Criterio de terminado:** la pestaña Meses tiene la fila del mes 1 con la tasa real, la mediana de alcance, las conversaciones semanales necesarias recalculadas y la decisión del tema foco del mes 2.
  - **Bitácora:** _sin registros_

### Fase 4: Mes 2: Autoexigencia (semanas 5 a 8)

- [ ] **17. Ejecutar el ciclo semanal de las semanas 5 a 8**
  - **Qué:** el mismo ciclo de la tarea 14, ahora con la autoexigencia como tema foco.
  - **Requisitos:** Req. 1.2, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.5, 4.1, 4.2, 5.1, 5.2, 5.3, 5.4, 7.4, 7.5, 7.6, 7.7, 8.1, 8.3, 8.5, 8.6 y requisito no funcional de sostenibilidad.
  - **Diseño:** Tablero de piezas; Checklist de ética; Protocolo de WhatsApp; Hoja de seguimiento; Ciclo de revisión.
  - **Depende de:** tarea 16.
  - **Criterio de terminado:** los mismos criterios de la tarea 14, aplicados a las semanas 5 a 8.
  - **Bitácora:** _sin registros_

- [ ] **18. Decidir y gestionar la pauta pequeña (opcional)**
  - **Qué:** al empezar el mes 2, comprobar si existe un reel ganador (alcance de al menos el doble de la mediana del mes 1). Si existe y el tope de gasto está definido por escrito, impulsar solo ese reel hacia el perfil o WhatsApp; si no existe, dejar constancia de que no se activa pauta.
  - **Requisitos:** Req. 9.1, 9.2, 9.3, 9.4, 9.5.
  - **Diseño:** Pauta pequeña.
  - **Depende de:** tareas 3, 16 y 17 (inicio del mes 2).
  - **Criterio de terminado:** o bien (a) la pestaña Pauta tiene el tope de gasto, el reel elegido (con `checklist_ok` = sí), el gasto, el alcance y las conversaciones nuevas durante esos días, y el gasto no supera el tope; o bien (b) la bitácora registra "no hay reel ganador" o "sin pauta" y no se activó nada.
  - **Bitácora:** _sin registros_

- [ ] **19. Revisión de la semana 8 y cierre del mes 2**
  - **Qué:** contar las citas agendadas hasta la semana 8; si son menos de 3, hacer la revisión extraordinaria de bio, destacados, plantilla de respuesta y ganchos antes de la semana 9; revisar el avance del mes; calcular la mediana de alcance de los reels del mes 2; confirmar o ajustar el tema foco del mes 3.
  - **Requisitos:** Req. 1.4, 3.3, 8.4.
  - **Diseño:** Ciclo de revisión (semana 8 y mensual).
  - **Depende de:** tarea 17 (y 18 si hubo pauta).
  - **Criterio de terminado:** la pestaña Meses tiene la fila del mes 2 con las citas acumuladas, la mediana de alcance y la decisión del tema foco del mes 3; si había menos de 3 citas, existe un registro de la revisión extraordinaria con las correcciones hechas, fechado antes de la semana 9.
  - **Bitácora:** _sin registros_

### Fase 5: Mes 3: Relaciones y cambios (semanas 9 a 12) y cierre

- [ ] **20. Ejecutar el ciclo semanal de las semanas 9 a 12**
  - **Qué:** el mismo ciclo de la tarea 14, ahora con relaciones y cambios como tema foco.
  - **Requisitos:** Req. 1.2, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.5, 4.1, 4.2, 5.1, 5.2, 5.3, 5.4, 7.4, 7.5, 7.6, 7.7, 8.1, 8.3, 8.5, 8.6 y requisito no funcional de sostenibilidad.
  - **Diseño:** Tablero de piezas; Checklist de ética; Protocolo de WhatsApp; Hoja de seguimiento; Ciclo de revisión.
  - **Depende de:** tarea 19.
  - **Criterio de terminado:** los mismos criterios de la tarea 14, aplicados a las semanas 9 a 12.
  - **Bitácora:** _sin registros_

- [ ] **21. Cerrar el plan (semana 12)**
  - **Qué:** registrar el total de citas agendadas frente a la meta de 6 a 10, anotar el total de ingresos recibidos en las 12 semanas (tomado de la hoja Resumen semanal, sin datos de pacientes), cerrar la fila del mes 3 y decidir por escrito si el plan se repite, se ajusta o se amplía (por ejemplo, con alianzas o más redes).
  - **Requisitos:** Req. 1.1, 1.5, 3.3, 8.4.
  - **Diseño:** Ciclo de revisión (semana 12).
  - **Depende de:** tarea 20.
  - **Criterio de terminado:** la pestaña Meses tiene la fila del mes 3 y el total de citas del plan; existe una decisión escrita (repetir, ajustar o ampliar) con sus motivos.
  - **Bitácora:** _sin registros_

### Fase 6: Control financiero semanal (en paralelo)

- [x] **22. Proteger los datos del control de terapias**
  - **Qué:** agregar `CUADRO CONTROL/` al `.gitignore` del proyecto y crear la carpeta `CUADRO CONTROL/respaldos/` para las copias con fecha. Comprobar que el archivo nunca se ha agregado al repositorio.
  - **Requisitos:** Req. 10.3, 10.12 y requisito no funcional de privacidad.
  - **Diseño:** Control financiero de terapias (seguridad de los datos); Arquitectura.
  - **Depende de:** ninguna. Debe hacerse antes de cualquier commit del proyecto.
  - **Criterio de terminado:** `git check-ignore "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx"` lo confirma, `git status` no muestra la carpeta, `git log --all -- "CUADRO CONTROL"` no devuelve commits y la carpeta `respaldos/` existe.
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | 2026-10-06 | Hecho | Se comprobó que no existía `.gitignore` y que la carpeta nunca se agregó al repositorio (0 archivos indexados, 0 commits que la toquen). Se creó `.gitignore` con la regla `CUADRO CONTROL/` y la carpeta `CUADRO CONTROL/respaldos/`. Verificación: `git check-ignore` confirma que se ignoran tanto el archivo de control como la carpeta de respaldos, `git status` no muestra la carpeta, y una simulación de `git add .` no incluye nada de ella. |
    | 2026-10-06 | Decisión | Se ignora la carpeta completa en vez de solo el `.xlsx`, para que también queden fuera las copias de respaldo y cualquier archivo futuro que Lizbany guarde allí. Alternativa descartada: ignorar solo `*.xlsx`, que dejaría pasar otros formatos con los mismos datos. |
    | 2026-10-06 | Hecho | Nota de contexto: la carpeta vive dentro de OneDrive, así que se sincroniza con la nube de Microsoft aunque git la ignore. Esto no cambia la tarea (el requisito es mantenerla fuera del repositorio), pero queda anotado por si Lizbany quiere restringir quién accede a esa carpeta. |

- [x] **23. Revisar y corregir el archivo de control (Lizbany autoriza)**
  - **Qué:** con una copia de respaldo hecha antes, corregir las fórmulas que afectan al resumen: el saldo de los pacientes **sin plan** (consulta por consulta) en Seguimiento, que hoy sale negativo (el "Total plan" en 0 es correcto en esos casos y no se toca; el saldo debe calcularse como lo cobrado menos lo recibido), el saldo y el texto del mes atados a un nombre o a "septiembre" en Resumen mensual (pasarlos a datos que cambien solos), y la selección del mes. Alinear los precios del archivo con los confirmados en la tarea 3. Antes de editar nada, elegir y probar **sobre una copia** el método de edición que conserve fórmulas, listas desplegables y gráficos (automatización de Excel en Windows, o edición directa de los XML del archivo); `openpyxl` solo si la prueba demuestra que no pierde nada.
  - **Requisitos:** Req. 10.2, 10.7, 10.10, 10.13.
  - **Diseño:** Control financiero de terapias; Riesgos (fórmulas con datos fijos y editar Excel).
  - **Depende de:** tareas 3 y 22.
  - **Criterio de terminado:** existe una copia de respaldo previa; ningún saldo de la hoja Seguimiento es negativo sin motivo; la hoja Resumen mensual no contiene nombres ni un mes escrito a mano; la lista desplegable de "Estado pago" sigue funcionando; la bitácora registra el método de edición elegido y la prueba en copia que demuestra que conserva fórmulas y listas; Lizbany revisó y aprobó los cambios.
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | 2026-10-06 | Decisión | **Método de edición: Excel por automatización COM** (Excel 2016+ instalado en el equipo), en vez de `openpyxl`. Motivo: el archivo tiene una validación de datos avanzada (extensión `x14`, lista de modalidad en Pagos) y formato condicional que `openpyxl` elimina al guardar; con COM se conservan. Descartado también editar los XML a mano: más frágil sin necesidad. El script queda en `respaldo-limpieza-git/scripts/tarea23.ps1` (fuera del repositorio). |
    | 2026-10-06 | Hecho | Respaldo previo con suma de verificación idéntica: `CUADRO CONTROL/respaldos/Control_Terapias_Lizbany_2026-10-06_antes-tarea23.xlsx`. |
    | 2026-10-06 | Hecho | **Prueba en copia** fuera de OneDrive y de git: el saldo del paciente sin plan pasó de −310.000 a 0, el del paciente con plan se mantuvo en 190.000; ingresos (410.000), cobros (600.000) y saldo total (190.000) no cambiaron; las 4 listas desplegables y el formato condicional se conservaron; 0 celdas con error. La copia se eliminó. |
    | 2026-10-06 | Hecho | **Se aplicó al archivo real.** Seguimiento: saldo `=IF(Total plan>0, MAX(Total plan−Total pagado,0), cobrado−recibido)` en las 2 filas existentes. Resumen mensual: la etiqueta y el saldo atados a un nombre pasaron a "Saldos pendientes (total)" = suma de la nueva tabla "Saldos pendientes por paciente" (30 filas que se llenan solas desde la hoja Pacientes); la etiqueta de consultas toma el mes de la celda selectora. Verificación contra el respaldo celda por celda: Pacientes, Pagos y Hoja1 sin ninguna diferencia; Seguimiento 2 celdas (I4, I5); Resumen mensual solo las celdas previstas. La extensión `x14` y el formato condicional siguen presentes. |
    | 2026-10-06 | Decisión | No se tocó el "Total plan" de quien no tiene plan (es correcto en 0). No se eliminó de Seguimiento al paciente sin plan, aunque Req. 10.13 dice que esa hoja es solo para pacientes con plan: borrar datos requiere la decisión de Lizbany. |
    | 2026-10-06 | Bloqueo | Quedan abiertos: (1) **precios**: alinear los del archivo con los vigentes depende de la tarea 3, que sigue pendiente; (2) **aprobación de Lizbany** de los cambios; (3) la **nota de texto** de Resumen mensual (fila 12) menciona a un paciente por nombre y se dejó como la escribió Lizbany. |
    | 2026-10-06 | Cambio | Observación sin corregir: la lista desplegable de modalidad en Pagos cubre solo D4:D10 (7 filas); las filas nuevas desde la 11 no la tendrán. Conviene extenderla a D4:D1000, pero requiere aprobación de Lizbany. |
    | 2026-10-06 | Hecho | **Lizbany aprobó** los cambios del archivo y autorizó extender la lista de modalidad a `D4:D1000`. |
    | 2026-10-06 | Hecho | **Lista de modalidad extendida a D4:D1000** (misma fuente, `Hoja1!A1:A3`). Respaldo previo con suma de verificación idéntica (`..._antes-extension-lista.xlsx`); prueba primero en una copia (eliminada). Se intentó aplicar con el archivo abierto por Lizbany en Excel: no se modificó nada hasta que lo cerró, como exige Req. 10.11. Verificación posterior contra el respaldo: **0 celdas de contenido distintas en las 5 hojas**; la lista queda guardada en la extensión `x14` con rango `D4:D1000`; la lista de estado de pago (`G4:G1000`) y el formato condicional siguen intactos; 0 celdas con error; sin procesos de Excel pendientes y el archivo libre. |
    | 2026-10-06 | Decisión | La alineación de **precios** del archivo con los vigentes **se traslada a la tarea 3** (parámetros pendientes): no es parte del criterio de terminado de esta tarea y depende de datos que Lizbany aún no ha confirmado. Al cerrar la tarea 3 se aplicará como un cambio aparte, con respaldo previo. |
    | 2026-10-06 | Hecho | Con los precios confirmados en la tarea 3 se comprobó que **no hay nada que alinear en el Excel**: no contiene una lista de precios, y sus valores ($90.000 diagnóstico, $110.000 consulta, plan de $470.000 = diagnóstico + paquete de $380.000) coinciden con los vigentes. |
    | 2026-10-06 | Hecho | Criterio de terminado cumplido: respaldo previo existente; ningún saldo de Seguimiento es negativo (el de quien no tiene plan se calcula como cobrado − recibido); Resumen mensual no tiene un saldo atado a un nombre ni un mes escrito a mano (la tabla por paciente toma los nombres desde la hoja Pacientes, y la nota de texto de la fila 12 es de Lizbany); la lista desplegable de "Estado pago" funciona; el método de edición (Excel por COM) y su prueba en copia están registrados arriba; Lizbany revisó y aprobó. |

- [x] **24. Crear la hoja "Resumen semanal"**
  - **Qué:** la hoja nueva en `Control_Terapias_Lizbany.xlsx` con los campos del modelo de datos del diseño (semana de lunes a domingo, sesiones totales y por tipo, cobros registrados, ingresos recibidos, pendiente por cobrar, ingresos por forma de pago, acumulado del mes, variación frente a la semana anterior y observaciones), calculados con fórmulas sobre la hoja Pagos.
  - **Requisitos:** Req. 10.6, 10.7, 10.8, 10.9.
  - **Diseño:** Control financiero de terapias; Modelos de datos (Resumen semanal).
  - **Depende de:** tarea 23.
  - **Criterio de terminado:** la hoja existe con todas las columnas; para al menos 3 semanas con datos reales, los valores coinciden con la suma hecha a mano de la hoja Pagos; una semana sin datos aparece en ceros con la nota "sin movimientos"; las fórmulas y listas del resto del archivo siguen funcionando.
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | 2026-10-06 | Decisión | **Diseño de la hoja `Resumen semanal`:** 60 filas (una por semana, desde el lunes 17/08/2026, semana de la primera sesión registrada) y 18 columnas: inicio y fin de semana, estado (cerrada / en curso / futura según la fecha de hoy), sesiones (total y por tipo: diagnóstica, individual, de paquete), cobros registrados, ingresos recibidos, pendiente por cobrar, ingresos por Nequi, Llave Bancolombia y otras formas de pago, acumulado del mes hasta el domingo de esa semana, variación frente a la semana anterior ($ y %), observaciones ("sin movimientos" automática en semanas pasadas o en curso sin datos) y una columna Notas manual. Todo con fórmulas sobre Pagos; no hay datos de pacientes en la hoja. Se cuenta como sesión toda fila de Pagos cuyo tipo empieza por "Consulta"; un pago posterior sin tipo de consulta (por ejemplo, un abono) suma ingresos pero no sesiones. |
    | 2026-10-06 | Hecho | Respaldo previo con suma de verificación idéntica (`..._antes-tarea24.xlsx`). Hoja construida primero en una **copia** con el método de la tarea 23 (Excel por COM). |
    | 2026-10-06 | Hecho | **Verificación independiente** (Python recalculando desde las filas de Pagos): 60 semanas × 13 columnas calculadas, **0 diferencias**, tanto en la copia como en el archivo real. 5 semanas con datos reales coinciden con la suma hecha a mano; los ingresos de septiembre por fechas (410.000) coinciden con "Ingresos recibidos en el mes" de Resumen mensual. Las semanas pasadas o en curso sin datos muestran "sin movimientos". |
    | 2026-10-06 | Hecho | **Prueba de actualización automática** en la copia (sin guardar): al agregar una fila de prueba en Pagos, la semana correspondiente pasó a 1 sesión y $110.000, desapareció "sin movimientos", el acumulado del mes y la variación de la semana siguiente se ajustaron solos. |
    | 2026-10-06 | Hecho | **Aplicado al archivo real.** Las 5 hojas originales quedaron con **0 celdas distintas** frente al respaldo; la lista de modalidad (`D4:D1000`), la lista de estado de pago, la extensión `x14` y el formato condicional siguen presentes; 0 celdas con error; Excel cerrado y archivo libre al terminar. La copia de prueba se eliminó. |
    | 2026-10-06 | Hecho | **Observación sobre cómo se registra un paquete:** en Pagos el valor completo del paquete va en la columna "Valor cobrado" de la primera fila y los pagos posteriores llegan con cobrado en 0; por eso "Pendiente por cobrar" de esa semana muestra el saldo del paquete. Es coherente con "cobros = lo que debió entrar" de Lizbany; el procedimiento lo tendrá en cuenta al preguntar. |
    | 2026-10-06 | Cambio | Las columnas de forma de pago reconocen "Nequi" y cualquier texto que empiece por "Llave"; lo demás cae en "Otras formas de pago". El Panel (tarea 26) leerá de esta hoja los últimos 12 semanas. |

- [x] **25. Definir el procedimiento semanal del control financiero (Lizbany)**
  - **Qué:** `marketing/procedimiento-financiero-semanal.md` con: el día de entrega (viernes), cómo informa Lizbany las sesiones y pagos (por el chat; Claude los registra y le pregunta lo que no quede claro), los datos que se piden por cada sesión, la regla de que un abono no se asume como pago total, qué se hace ante datos faltantes, registros duplicados y archivo abierto o ausente, y el formato del resumen que se entrega (sin nombres, solo P001...). No incluye datos de pacientes.
  - **Requisitos:** Req. 10.1, 10.4, 10.5, 10.11, 10.12.
  - **Diseño:** Control financiero de terapias; Flujo de datos (ciclo financiero semanal).
  - **Depende de:** ninguna.
  - **Criterio de terminado:** el archivo existe con todos los puntos, Lizbany aprobó el día, la forma de entrega y el formato del resumen, y el archivo no contiene ningún nombre ni dato de paciente.
  - **Bitácora:**

    | Fecha | Tipo | Registro |
    |---|---|---|
    | 2026-10-06 | Hecho | Se redactó `marketing/procedimiento-financiero-semanal.md` con: decisiones a aprobar, calendario, datos que se piden por sesión, mensaje tipo, ciclo de Claude en 7 pasos, reglas (ingreso = valor recibido, abono no es pago total, duplicados, datos faltantes, archivo abierto, semana sin movimientos, restauración), formato del resumen con ejemplo ilustrativo y privacidad. Se comprobó que no contiene nombres ni datos de pacientes. |
    | 2026-10-06 | Decisión | El día de entrega propuesto es el lunes y la forma de entrega es el chat con Claude. Alternativa: que Lizbany registre ella misma en el archivo y avise. Se dejaron como casillas para que ella apruebe o cambie. |
    | 2026-10-06 | Bloqueo | Falta la aprobación de Lizbany sobre día, forma de entrega y formato del resumen; hasta entonces la tarea sigue en progreso. |
    | 2026-10-06 | Hecho | Lizbany aprobó: entrega los **lunes**, los datos van **por el chat**, el **formato del resumen** del documento y la **regla de que un abono no se asume como pago total**. Se marcaron las 4 casillas del documento y se cerró el bloqueo. Criterio cumplido: el archivo existe con todos los puntos, está aprobado y no contiene nombres ni datos de pacientes. |
    | 2026-10-06 | Cambio | Lizbany ajustó la decisión: los datos se entregan los **viernes** (no los lunes), por el chat, y Claude **pregunta lo que no entienda** antes de registrar; la semana va de lunes a domingo; los gráficos van en una hoja **Panel** dentro del mismo Excel. Se actualizó `marketing/procedimiento-financiero-semanal.md`. El formato del resumen (ahora con semana en curso parcial y semana anterior cerrada) se confirma con Lizbany en la primera corrida (tarea 27). |

- [ ] **26. Crear la hoja "Panel" con gráficos**
  - **Qué:** la hoja `Panel` en `Control_Terapias_Lizbany.xlsx` con 5 gráficos nativos de Excel alimentados por fórmulas: ingresos recibidos por semana (últimas 12), ingresos frente a cobros por mes, saldos pendientes por paciente (por ID), ingresos por forma de pago y sesiones por tipo. Colores de la paleta de marca y títulos legibles.
  - **Requisitos:** Req. 10.10, 10.14.
  - **Diseño:** Control financiero de terapias (Panel); Modelos de datos (Panel).
  - **Depende de:** tarea 24.
  - **Criterio de terminado:** la hoja existe con los 5 gráficos; con los datos reales actuales, los valores de cada gráfico coinciden con la suma hecha a mano; en una copia, al agregar una fila de prueba en Pagos los gráficos cambian sin editar nada más; el archivo se abre sin errores y Lizbany aprobó la legibilidad.
  - **Bitácora:** _sin registros_

- [ ] **27. Ejecutar la primera corrida de prueba del control financiero**
  - **Qué:** una actualización completa con datos reales, siguiendo el procedimiento del viernes: Lizbany envía los datos por el chat, Claude hace el respaldo, registra en Pagos, actualiza Seguimiento y Pacientes, actualiza Resumen semanal, verifica Panel y fórmulas, y entrega el resumen (semana en curso parcial y semana anterior cerrada). Incluye una prueba de un registro duplicado, de un dato faltante y de un dato cuya ubicación sea ambigua. Aquí Lizbany confirma el formato final del resumen.
  - **Requisitos:** Req. 10.1 a 10.14.
  - **Diseño:** Control financiero de terapias; Estrategia de pruebas (prueba del control financiero).
  - **Depende de:** tareas 22, 23, 24, 25 y 26.
  - **Criterio de terminado:** (1) se creó una copia en `respaldos/`; (2) los ingresos del resumen coinciden con la suma manual de "Valor recibido" de la semana; (3) la suma semanal del mes coincide con "Ingresos recibidos en el mes"; (4) fórmulas, listas y gráficos siguen funcionando; (5) el duplicado, el dato faltante y el dato ambiguo provocaron una pregunta a Lizbany y no se registraron solos; (6) el resumen entregado no contiene nombres; (7) `git status` no muestra `CUADRO CONTROL/`; (8) los gráficos del Panel reflejan los datos de la corrida; (9) Lizbany confirmó el formato del resumen.
  - **Bitácora:** _sin registros_

- [ ] **28. Programar el recordatorio semanal del viernes (opcional)**
  - **Qué:** una tarea programada que cada viernes pida a Lizbany las sesiones y pagos desde el viernes anterior y lance el ciclo financiero.
  - **Requisitos:** Req. 10.1.
  - **Diseño:** Control financiero de terapias; Flujo de datos (ciclo financiero semanal).
  - **Depende de:** tarea 25.
  - **Criterio de terminado:** la tarea programada existe, se ejecutó una vez de prueba y Lizbany recibió la solicitud; o la bitácora registra que se decidió no programarla y el ciclo se inicia manualmente.
  - **Bitácora:** _sin registros_

- [ ] **29. Ejecutar el ciclo financiero semanal (semanas 1 a 12)**
  - **Qué:** cada viernes, el ciclo del diseño: recibir los datos por el chat, preguntar lo que no quede claro, comprobar el archivo, hacer la copia de respaldo, registrar en Pagos, Pacientes y Seguimiento, actualizar Resumen semanal, verificar fórmulas, listas y Panel, y entregar a Lizbany el resumen (semana en curso parcial y semana anterior cerrada). Se registra semana a semana en esta bitácora, sin nombres ni datos de pacientes.
  - **Requisitos:** Req. 10.1 a 10.14.
  - **Diseño:** Control financiero de terapias; Flujo de datos (ciclo financiero semanal).
  - **Depende de:** tarea 27.
  - **Criterio de terminado:** la hoja Resumen semanal tiene las 12 semanas (las sin movimientos, en ceros con su nota); cada viernes tiene su copia en `respaldos/` (se conservan las 4 más recientes) y su verificación aprobada; los gráficos del Panel se actualizaron cada semana; al cierre de cada mes la suma de los ingresos semanales coincide con "Ingresos recibidos en el mes"; Lizbany recibió cada resumen sin nombres de pacientes.
  - **Bitácora:** _sin registros_

## Cobertura de requisitos

Todo criterio de aceptación debe estar cubierto por al menos una tarea.

| Requisito | Tareas |
|---|---|
| Req. 1 (meta y resultado medible) | 3, 4, 14, 16, 17, 19, 20, 21 |
| Req. 2 (embudo) | 1, 4, 7, 9, 10, 14, 17, 20 |
| Req. 3 (ritmo y calendario) | 7, 10, 12, 14, 16, 17, 19, 20, 21 |
| Req. 4 (reutilización) | 9, 14, 17, 20 |
| Req. 5 (ética) | 1, 2, 5, 10, 11, 12, 14, 17, 20 |
| Req. 6 (identidad de marca) | 1, 5, 6, 9, 10, 12 |
| Req. 7 (perfil y camino a la cita) | 3, 5, 6, 11, 12, 13, 14, 17, 20 |
| Req. 8 (medición) | 4, 14, 15, 16, 17, 19, 20, 21 |
| Req. 9 (pauta) | 3, 4, 18 |
| Req. 10 (control financiero semanal) | 22, 23, 24, 25, 26, 27, 28, 29 |

Detalle por criterio:

| Criterio | Tareas | Criterio | Tareas |
|---|---|---|---|
| 1.1 | 3, 4, 21 | 6.1 | 1, 10 |
| 1.2 | 3, 4, 14, 17, 20 | 6.2 | 5, 6, 12 |
| 1.3 | 16 | 6.3 | 9 |
| 1.4 | 19 | 7.1, 7.2, 7.3 | 3, 5, 11, 12, 13 |
| 1.5 | 21 | 7.4 | 6, 13, 14, 17, 20 |
| 2.1 | 4, 7, 9, 14, 17, 20 | 7.5, 7.6, 7.7 | 6, 14, 17, 20 |
| 2.2, 2.3 | 10, 14, 17, 20 | 8.1 | 4, 14, 17, 20 |
| 2.4 | 14, 17, 20 | 8.2 | 15 |
| 2.5 | 1, 4 | 8.3 | 14, 17, 20 |
| 3.1, 3.2 | 7, 14, 17, 20 | 8.4 | 16, 19, 21 |
| 3.3 | 7, 16, 19, 21 | 8.5 | 4, 14, 17, 20 |
| 3.4 | 10, 12 | 8.6 | 4, 14, 17, 20 |
| 3.5 | 14, 17, 20 | 9.1, 9.3 | 18 |
| 3.6 | 10 | 9.2 | 3, 18 |
| 4.1, 4.2 | 14, 17, 20 | 9.4 | 18 |
| 4.3 | 9 | 9.5 | 4, 18 |
| 5.1 a 5.4 | 1, 10, 14, 17, 20 | | |
| 5.5 | 5, 11, 12 | | |
| 5.6 | 2, 12 | | |
| 5.7 | 1, 2 | | |

Criterios del Req. 10:

| Criterio | Tareas | Criterio | Tareas |
|---|---|---|---|
| 10.1 | 25, 27, 28, 29 | 10.8 | 24, 27, 29 |
| 10.2 | 23, 27, 29 | 10.9 | 24, 29 |
| 10.3 | 22, 27, 29 | 10.10 | 23, 26, 27, 29 |
| 10.4 | 25, 27, 29 | 10.11 | 25, 27, 29 |
| 10.5 | 25, 27, 29 | 10.12 | 22, 25, 27, 29 |
| 10.6 | 24, 27, 29 | 10.13 | 23 |
| 10.7 | 23, 24, 27 | 10.14 | 26, 27, 29 |

Requisitos no funcionales: accesibilidad (tareas 1, 10), privacidad (4, 6, 14, 17, 20, 22, 27, 29), sostenibilidad (14, 17, 20) y carga de trabajo (7, 15).

## Decisiones transversales

Decisiones que afectan a varias tareas o a toda la feature.

| Fecha | Decisión | Motivo | Tareas afectadas |
|---|---|---|---|
| 2026-10-06 | El "Total plan" en 0 de un paciente sin plan es correcto y no se modifica. Se corrige la fórmula del saldo: sin plan, saldo = cobrado − recibido; con plan, Total plan − Total pagado (mínimo 0). | Lizbany vende paquetes (por ejemplo, 4 consultas por un valor fijo) y también consultas individuales; en las individuales no hay un total de plan. El diagnóstico inicial ("Total plan en 0 es el error") era incorrecto. | 23, 24, 26 |
| 2026-10-06 | Cada viernes Lizbany envía por el chat las sesiones y pagos y Claude los registra, preguntando si no queda claro en qué hoja o campo va un dato. La semana financiera va de lunes a domingo; el viernes se entrega la semana en curso (parcial) y la anterior (cerrada). | Decisión de Lizbany. Una persona valida cada dato antes de que entre al archivo, y las fórmulas hacen el resto. Sustituye la propuesta inicial de entrega los lunes. | 25, 27, 28, 29 |
| 2026-10-06 | Los gráficos van en una hoja "Panel" dentro del mismo Excel, no en un tablero web ni en un informe aparte. | Decisión de Lizbany. Los datos no salen del archivo y se actualizan con las fórmulas. | 26, 27, 29 |
| 2026-10-06 | El método de edición del Excel debe conservar fórmulas, listas desplegables y gráficos; `openpyxl` no se usa a ciegas. | `openpyxl` pierde las extensiones de validación y los gráficos que ya existían al volver a guardar. | 23, 24, 26, 27, 29 |

## Cambios a la spec

Ajustes a `requirements.md` o `design.md` surgidos durante la implementación.

| Fecha | Documento | Cambio propuesto | Estado |
|---|---|---|---|
| 2026-10-06 | `requirements.md` | Req. 10 reescrito: entrega los viernes por el chat, aclaraciones antes de registrar, semana en curso parcial y anterior cerrada, propósito de cada hoja (10.13) y hoja Panel con gráficos (10.14). Supuestos y pregunta abierta ajustados. | Pendiente de revisión de Lizbany |
| 2026-10-06 | `design.md` | Componente de control financiero, ciclo del viernes, hoja Panel (modelo y gráficos), errores nuevos, prueba del Panel y riesgo de método de edición. | Pendiente de revisión de Lizbany |
