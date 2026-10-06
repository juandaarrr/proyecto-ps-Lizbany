# Documento de Requisitos: Plan de marketing en redes sociales (Lizbany Arango)

## Introducción

Plan de 12 semanas para que Ps. Lizbany Arango, psicóloga clínica, consiga pacientes nuevos a través de Instagram (`@ps.lizbanyarango`). El plan lleva a una persona de 20 a 40 años desde "no la conoce" hasta "le escribe por WhatsApp para agendar una cita virtual", mediante un embudo de tres etapas (Atraer, Confiar, Agendar), tres pilares de contenido con un tema foco por mes, una rutina de medición semanal y reglas de ética profesional. La meta es **6 a 10 pacientes nuevos en 3 meses**, con una capacidad de producción de 3 publicaciones por semana. Además, cada semana se actualiza el archivo de control de terapias de Lizbany y se le entrega un resumen financiero de lo que ingresó por las sesiones, para que lleve un seguimiento de sus entradas de capital.

## Supuestos

- La plataforma principal es Instagram (reels, carruseles e historias). Las demás redes no se trabajan.
- La cuenta tiene menos de 500 seguidores al inicio, y es una cuenta profesional (con estadísticas). Si no lo es, se convierte antes de la semana 1.
- Lizbany produce su contenido sola (graba, edita y publica). Sin presupuesto de pauta salvo el extra pequeño descrito en el Req. 9.
- La conversión principal es el contacto por WhatsApp con el mensaje "Hola Liz, quiero agendar una cita." (el mismo de la web). Instagram no recibe pagos ni agenda citas.
- Hipótesis de conversión: 1 de cada 4 conversaciones nuevas por WhatsApp termina en una cita agendada. Se valida en la semana 4 (Req. 1.3).
- Las semanas se cuentan desde la **semana 1**, que empieza en la fecha de inicio que defina Lizbany (aún no fijada).
- "Al menos la mitad" de las piezas del mes sobre el tema foco y el plazo de 24 horas para responder mensajes son valores propuestos por este documento, ajustables por Lizbany.
- El material ya producido (reels finales, ideas de reels y carruseles, publicaciones) se reutiliza donde encaje con los temas de cada mes.
- La paleta (`#D9DD92`, `#776472`, `#DB9065`, `#646F4B`, `#71816D`) y las tipografías (Guía, Arsenal, Lustria) están definidas en `PROYECTO MARCA PERSONAL.docx`.
- El control financiero usa como única base el archivo `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx` (hojas Pacientes, Pagos, Seguimiento y Resumen mensual). Contiene nombres de pacientes y pagos reales, por lo que es información sensible.
- Claude no conoce por sí mismo las sesiones ni los pagos: Lizbany los envía por el chat cada viernes y Claude los registra en el archivo; si no le queda claro en qué hoja o campo va un dato, pregunta antes de registrarlo.
- La semana financiera va de lunes a domingo. Lizbany envía los datos cada viernes (lo ocurrido desde el viernes anterior); el resumen de ese viernes muestra la semana en curso de forma parcial (lunes a viernes) y la semana anterior ya cerrada. Si Lizbany atiende sábados o domingos, esas sesiones entran en el registro del viernes siguiente y actualizan su semana.
- Cada ingreso se asigna a la semana de la fecha de su fila en Pagos; un pago posterior de una sesión anterior se registra como una fila nueva con la fecha en que se recibió (como ya se hizo con un abono registrado en septiembre).

## Glosario

- **El sistema**: el plan de marketing y quienes lo operan (Lizbany y, como apoyo, Claude). "THE SYSTEM SHALL" significa "el plan exige".
- **Pieza**: un reel, un carrusel o una historia publicados.
- **Pilar**: uno de los tres temas de contenido: (1) ansiedad y preocupación, (2) autoexigencia y perfeccionismo, (3) relaciones y cambios.
- **Tema foco**: el pilar que lidera un mes: mes 1 ansiedad, mes 2 autoexigencia, mes 3 relaciones y cambios.
- **Etapa del embudo**: Atraer (llegar a gente nueva), Confiar (generar confianza) o Agendar (invitar a escribir).
- **Conversación nueva**: una persona que escribe por primera vez por WhatsApp con interés en agendar.
- **Cita agendada**: una conversación nueva que termina con día y hora confirmados para una primera sesión.
- **Reel ganador**: un reel cuyo alcance es al menos el doble de la mediana de alcance de los reels publicados en el mes anterior.
- **Banco de piezas**: piezas ya terminadas y listas para publicar.
- **Checklist de ética**: lista de verificación de los puntos del Req. 5 que cada pieza debe pasar antes de publicarse.
- **Hoja de seguimiento**: la hoja donde se registran las métricas de marketing, las piezas publicadas y los aprendizajes de cada semana. No contiene datos de pacientes.
- **Control de terapias**: el archivo `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx`, donde Lizbany lleva sus pacientes, sesiones y pagos. Es independiente de la hoja de seguimiento.
- **Ingreso recibido**: dinero efectivamente recibido por una sesión (columna "Valor recibido" de Pagos). No incluye lo cobrado que aún no se ha pagado.
- **Resumen financiero semanal**: el informe que se entrega cada semana con las entradas de capital por las sesiones (ver Req. 10).

## Requisitos

### Requisito 1: Meta y resultado medible

**Historia de usuario:** Como psicóloga, quiero una meta numérica clara, para saber si el plan funciona y cuándo corregirlo.

#### Criterios de aceptación

1. THE SYSTEM SHALL fijar como meta que entre **6 y 10 pacientes nuevos** tengan su primera cita agendada dentro de las 12 semanas contadas desde la semana 1.
2. THE SYSTEM SHALL fijar como indicador principal **2 a 3 conversaciones nuevas por WhatsApp por semana** (24 a 40 en 12 semanas).
3. WHEN termine la semana 4 THE SYSTEM SHALL calcular la tasa real de conversaciones que terminaron en cita y compararla con la hipótesis de 1 de cada 4, y recalcular cuántas conversaciones semanales hacen falta para la meta.
4. IF al cierre de la semana 8 hay menos de 3 citas agendadas THEN THE SYSTEM SHALL hacer una revisión extraordinaria de bio, destacados, plantilla de respuesta y ganchos antes de empezar la semana 9, y registrar sus conclusiones en la hoja de seguimiento.
5. WHEN termine la semana 12 THE SYSTEM SHALL registrar el total de citas agendadas y decidir, por escrito, si el plan se repite, se ajusta o se amplía.

### Requisito 2: Embudo Atraer, Confiar, Agendar

**Historia de usuario:** Como psicóloga, quiero que cada pieza tenga un papel claro en el recorrido de la persona, para que el contenido no sea suelto sino que lleve a escribirme.

#### Criterios de aceptación

1. THE SYSTEM SHALL asignar a cada pieza exactamente una etapa del embudo (Atraer, Confiar o Agendar) antes de producirla, y registrarla en la hoja de seguimiento.
2. WHEN una pieza es un reel (etapa Atraer) THE SYSTEM SHALL abrir con un gancho en los primeros 3 segundos y cerrar con una invitación a guardar, compartir o comentar.
3. WHEN una pieza es un carrusel (etapa Confiar) THE SYSTEM SHALL explicar una idea del enfoque cognitivo-conductual en lenguaje sencillo, o proponer un ejercicio breve de una página o menos.
4. WHEN una pieza es una historia (etapa Agendar) THE SYSTEM SHALL mostrar un solo mensaje sobre cómo son las sesiones, los precios o cómo agendar, con el enlace o la invitación a escribir por WhatsApp.
5. IF una pieza no tiene etapa asignada THEN THE SYSTEM SHALL no publicarla hasta asignársela.

### Requisito 3: Ritmo de publicación y calendario

**Historia de usuario:** Como psicóloga que produce sola, quiero un ritmo realista y un calendario, para publicar con constancia sin agotarme.

#### Criterios de aceptación

1. WHILE el plan esté vigente THE SYSTEM SHALL publicar cada semana **2 reels y 1 carrusel** (propuesta: reel el lunes, carrusel el miércoles, reel el viernes), es decir, 24 reels y 12 carruseles en 12 semanas.
2. WHILE el plan esté vigente THE SYSTEM SHALL publicar entre 2 y 3 historias por semana, que no cuentan dentro de las 3 publicaciones semanales.
3. WHILE se cumple un mes THE SYSTEM SHALL destinar al tema foco de ese mes al menos la mitad de sus piezas y publicar al menos una pieza de cada uno de los otros dos pilares.
4. WHEN empiece la semana 1 THE SYSTEM SHALL tener en el banco de piezas al menos 3 piezas terminadas (una semana completa).
5. IF una semana termina con menos de 3 publicaciones (2 reels y 1 carrusel) THEN THE SYSTEM SHALL registrar el motivo en la hoja de seguimiento y usar el banco de piezas para la semana siguiente.
6. WHEN se graba contenido nuevo THE SYSTEM SHALL permitir grabar varios reels en una misma sesión (en tandas), y registrar las piezas resultantes en el banco.

### Requisito 4: Reutilización de contenido

**Historia de usuario:** Como psicóloga con poco tiempo, quiero aprovechar cada grabación en varios formatos, para producir menos y publicar más.

#### Criterios de aceptación

1. WHEN se publica un reel THE SYSTEM SHALL derivar de él al menos una historia, publicada dentro de los 7 días siguientes.
2. WHEN un reel supera la mediana de alcance de los reels del mes THE SYSTEM SHALL considerar su idea como candidata a un carrusel posterior.
3. WHEN existe material ya producido que encaja con el tema foco del mes THE SYSTEM SHALL preferir reutilizarlo (actualizado si hace falta) antes de crear una pieza nueva.

### Requisito 5: Ética profesional y seguridad del contenido

**Historia de usuario:** Como psicóloga, quiero que ninguna pieza ni mensaje ponga en riesgo a las personas ni mi ejercicio profesional, para comunicar con confianza.

#### Criterios de aceptación

1. THE SYSTEM SHALL no incluir en ninguna pieza diagnósticos, promesas de cura ni resultados garantizados.
2. THE SYSTEM SHALL no usar testimonios ni casos de pacientes, reales o disfrazados, en ninguna pieza.
3. WHEN una pieza trata un tema de salud mental THE SYSTEM SHALL evitar lenguaje que invite al autodiagnóstico (por ejemplo, listas del tipo "si haces X, tienes Y trastorno") y usar un tono acogedor y no alarmista.
4. WHEN una pieza está lista para publicarse THE SYSTEM SHALL pasarla por el checklist de ética y publicarla solo si cumple todos sus puntos.
5. THE SYSTEM SHALL mostrar, en el perfil o en un destacado, un aviso de que el contenido y la cuenta no reemplazan la atención de urgencias en salud mental y de que, en caso de crisis, se contacte la línea de emergencia local.
6. WHEN falten más de 7 días para publicar la primera pieza THE SYSTEM SHALL pedir a Lizbany que revise las reglas de publicidad del Código Deontológico del psicólogo (Ley 1090 de 2006) con el Colegio Colombiano de Psicólogos, y registrar en la hoja de seguimiento la fecha de la revisión y sus conclusiones.
7. IF la revisión del punto anterior produce restricciones nuevas THEN THE SYSTEM SHALL actualizar el checklist de ética y revisar las piezas del banco antes de publicarlas.

### Requisito 6: Identidad de marca

**Historia de usuario:** Como psicóloga, quiero que todo se vea y se sienta como mi marca, para que me reconozcan y me recuerden.

#### Criterios de aceptación

1. THE SYSTEM SHALL usar en las piezas únicamente los 5 colores de la paleta de marca y las tipografías Guía (títulos), Arsenal (subtítulos) y Lustria (textos).
2. THE SYSTEM SHALL usar en todas las invitaciones a agendar el mismo mensaje de WhatsApp: "Hola Liz, quiero agendar una cita."
3. WHEN una pieza reutiliza material anterior con otra paleta o tipografía THE SYSTEM SHALL ajustarla a la identidad actual antes de publicarla.

### Requisito 7: Perfil y camino hacia la cita

**Historia de usuario:** Como persona que descubre a Lizbany, quiero entender rápido a quién ayuda y cómo agendar, para dar el paso sin dudas.

#### Criterios de aceptación

1. WHEN empiece la semana 1 THE SYSTEM SHALL tener una bio que diga a quién ayuda y qué enfoque usa, en una frase, e incluya el enlace a WhatsApp con el mensaje del Req. 6.2.
2. WHEN empiece la semana 1 THE SYSTEM SHALL tener al menos 4 destacados de historias: cómo son las sesiones, precios, cómo agendar y preguntas frecuentes.
3. THE SYSTEM SHALL mostrar en los destacados los precios vigentes: $100.000 COP por sesión y $350.000 COP por el paquete de 4 sesiones, con el aviso de modalidad virtual y duración de 60 minutos.
4. WHEN llega una conversación nueva por WhatsApp THE SYSTEM SHALL responder en máximo 24 horas con una plantilla breve y cálida que proponga un horario.
5. THE SYSTEM SHALL no pedir ni aceptar datos clínicos por WhatsApp antes de la primera consulta; ahí solo se coordina el horario y la modalidad.
6. IF alguien escribe en crisis (por ejemplo, expresa riesgo para su vida) THEN THE SYSTEM SHALL responder de forma breve y cálida con la línea de emergencia local y no abordar el caso por mensajes.
7. IF alguien deja un comentario negativo o intenta un diagnóstico en los comentarios THEN THE SYSTEM SHALL responder una vez, de forma breve y amable, sin entrar en terapia, y no borrar comentarios que solo expresen desacuerdo.

### Requisito 8: Medición y decisión semanal

**Historia de usuario:** Como psicóloga, quiero ver rápido qué funciona, para repetirlo y dejar de gastar energía en lo que no.

#### Criterios de aceptación

1. WHEN termine cada semana THE SYSTEM SHALL registrar en la hoja de seguimiento: piezas publicadas, alcance de cada reel, guardados, compartidos, visitas al perfil, clics al enlace de WhatsApp, conversaciones nuevas y citas agendadas.
2. THE SYSTEM SHALL diseñar el registro semanal para que lleve 10 minutos o menos.
3. WHEN termine cada semana THE SYSTEM SHALL identificar el reel de mayor alcance y planear repetir su formato o tema en la semana siguiente.
4. WHEN termine cada mes THE SYSTEM SHALL revisar el avance frente a la meta (Req. 1) y confirmar o ajustar el tema foco del mes siguiente.
5. IF una métrica no está disponible THEN THE SYSTEM SHALL anotar "n/d" en esa celda y la causa, sin dejar la fila vacía.
6. THE SYSTEM SHALL no guardar en la hoja de seguimiento de marketing nombres ni datos personales de las personas que escriben; solo conteos.

### Requisito 9: Pauta pequeña opcional

**Historia de usuario:** Como psicóloga con una cuenta nueva, quiero poder dar un empujón pagado a lo que ya funciona, para llegar a más gente sin gastar a ciegas.

#### Criterios de aceptación

1. WHEN empiece el mes 2 THE SYSTEM SHALL permitir impulsar con pauta solo un reel ganador del mes anterior.
2. THE SYSTEM SHALL exigir que Lizbany defina por escrito un tope de gasto total antes de activar cualquier pauta, y no superarlo.
3. IF no existe un reel ganador THEN THE SYSTEM SHALL no activar pauta y continuar solo con contenido orgánico.
4. THE SYSTEM SHALL dirigir la pauta al perfil o al WhatsApp con el mensaje del Req. 6.2, y exigir que el reel impulsado haya pasado el checklist de ética.
5. WHEN se active una pauta THE SYSTEM SHALL registrar en la hoja de seguimiento el gasto, el alcance obtenido y las conversaciones nuevas que llegaron durante esos días.

### Requisito 10: Control financiero semanal de las sesiones

**Historia de usuario:** Como psicóloga, quiero enviar cada viernes la información de mis sesiones y pagos y ver actualizados mi archivo de control de terapias y un panel gráfico de lo que ingresó, para llevar un seguimiento claro de mis entradas de capital.

#### Criterios de aceptación

1. WHEN llegue el viernes de cada semana THE SYSTEM SHALL recibir por el chat las sesiones y pagos que Lizbany envíe desde el viernes anterior y registrarlos en `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx`, que es la única base: cada sesión o pago en la hoja Pagos (fecha, paciente, tipo de consulta, modalidad, valor cobrado, valor recibido, estado de pago, forma de pago), los pacientes nuevos o sus cambios de estado en Pacientes, y el avance de los pacientes con plan en Seguimiento.
2. WHEN se registren sesiones o pagos THE SYSTEM SHALL actualizar, para cada paciente afectado, las consultas realizadas y pendientes, la última y la próxima consulta, el total pagado y el saldo pendiente, y en Pacientes el estado cuando Lizbany informe un cambio.
3. WHEN vaya a modificarse el archivo THE SYSTEM SHALL guardar antes una copia de respaldo con la fecha en el nombre y conservar al menos las 4 copias más recientes.
4. IF falta o es dudoso un dato (fecha, valor, estado, forma de pago, paciente o si corresponde a un plan), o no está claro en qué hoja o campo va, THEN THE SYSTEM SHALL hacer una pregunta de aclaración a Lizbany y no registrarlo hasta tener la respuesta; un abono se registra como abono y nunca se asume como pago total.
5. IF un registro nuevo coincide con uno existente en fecha, paciente y valor THEN THE SYSTEM SHALL pedir confirmación antes de agregarlo.
6. WHEN termine el registro THE SYSTEM SHALL entregar un resumen financiero de la semana en curso (parcial, de lunes a viernes) y de la semana anterior (cerrada, con su fin de semana), con: sesiones realizadas (total y por tipo), cobros registrados, ingresos recibidos, monto pendiente por cobrar, ingresos por forma de pago, acumulado del mes y variación frente a la semana anterior.
7. THE SYSTEM SHALL calcular los ingresos a partir de la columna "Valor recibido", asignar cada ingreso a la semana (de lunes a domingo) de la fecha de su fila, y no contar como ingreso lo cobrado y no recibido.
8. THE SYSTEM SHALL guardar cada semana como una fila en la hoja "Resumen semanal" del mismo archivo, calculada con fórmulas que se recalculan solas, de modo que la fila de una semana se actualiza si después llegan sesiones o pagos con fecha de esa semana (por ejemplo, los del fin de semana).
9. IF la semana no tiene sesiones ni pagos THEN THE SYSTEM SHALL registrar la semana con valores en cero y la nota "sin movimientos", y entregar igualmente el resumen.
10. WHEN termine de guardar THE SYSTEM SHALL verificar que las fórmulas, las listas desplegables y los gráficos del archivo siguen funcionando y que la suma de los ingresos semanales del mes coincide con "Ingresos recibidos en el mes" de la hoja Resumen mensual; IF la verificación falla THEN THE SYSTEM SHALL restaurar la copia de respaldo y avisar a Lizbany.
11. IF el archivo no se encuentra o está abierto en otro programa THEN THE SYSTEM SHALL no modificarlo y avisar a Lizbany.
12. THE SYSTEM SHALL mostrar en el resumen entregado por el chat los saldos pendientes solo con el identificador del paciente (P001, P002...), no con su nombre, y no copiar datos de pacientes ni de pagos al repositorio de git, a la hoja de seguimiento de marketing ni a los archivos de `marketing/`.
13. THE SYSTEM SHALL mantener cada hoja con su propósito: Pacientes (pacientes existentes, fecha de inicio, si están activos —Lizbany informa cuando uno deja de serlo— y notas, como si adquirieron o no un plan), Pagos (registro semana a semana de sesiones y pagos), Seguimiento (solo pacientes con plan: cuánto debe cada uno y si ya pagó todo) y Resumen mensual (ingresos, cobros —lo que debió entrar— y saldos pendientes por paciente); y calcular el saldo de un paciente sin plan como lo cobrado menos lo recibido.
14. THE SYSTEM SHALL mantener una hoja "Panel" en el mismo archivo, con gráficos que se actualizan solos al registrar datos y que muestran: ingresos recibidos por semana (últimas 12 semanas), ingresos frente a cobros por mes, saldos pendientes por paciente (identificados por ID), ingresos por forma de pago y sesiones por tipo.

## Requisitos no funcionales

- **Carga de trabajo:** el plan no debe exigir más de 3 publicaciones por semana (más historias ligeras) ni más de 10 minutos de medición semanal.
- **Privacidad:** no se almacenan datos personales ni clínicos de personas que escriben, y los datos de pacientes y pagos del control de terapias no salen de su carpeta ni entran al repositorio de git; se respetan las normas de protección de datos personales de Colombia (Ley 1581 de 2012), a confirmar por Lizbany.
- **Accesibilidad de las piezas:** los reels llevan subtítulos y el texto en pantalla es legible sobre el fondo (contraste de al menos 4.5:1 en texto normal).
- **Sostenibilidad:** debe existir siempre un banco de al menos 3 piezas terminadas a partir de la semana 2.

## Fuera de alcance

- Otras redes sociales (TikTok, LinkedIn, Facebook) y pauta de gran presupuesto.
- Alianzas con otros profesionales y colaboraciones con otras cuentas (posible fase 2).
- Producir los reels, carruseles y el material gráfico en sí: el plan define qué y cuándo, no genera las piezas.
- Cambios al sitio web de Lizbany.
- Atención clínica por mensajes o comentarios.
- Contabilidad formal, impuestos, facturación y conciliación bancaria: el resumen financiero es un seguimiento de entradas, no un registro contable.
- Cobros automáticos o recordatorios de pago a los pacientes.
- Proyecciones financieras y análisis de rentabilidad de la pauta (posible mejora posterior).

## Preguntas abiertas

- ¿Cuál es la fecha de inicio de la semana 1?
- ¿Cuántos seguidores y cuántos pacientes tiene hoy Lizbany? ¿La cuenta ya es profesional?
- ¿Se confirma la hipótesis de 1 de cada 4 conversaciones que terminan en cita, o su experiencia es distinta?
- ¿Quién responde los mensajes de WhatsApp, y el plazo de 24 horas es realista?
- ¿Cuál es el tope de gasto para la pauta pequeña (Req. 9.2)?
- ¿Qué dice la revisión con el Colegio Colombiano de Psicólogos sobre la publicidad permitida (Req. 5.6)?
- ¿Lizbany atiende sábados o domingos? Si es así, esas sesiones se registran el viernes siguiente y actualizan la semana anterior.
- Los precios del archivo de control ($90.000 la consulta diagnóstica, $110.000 la individual, $470.000 un plan mensual de 4 consultas) no coinciden con los de `PROYECTO MARCA PERSONAL.docx` ($100.000 por sesión y $350.000 por 4 sesiones), que usa el Req. 7.3 para los destacados. ¿Cuáles son los precios vigentes?
- El archivo tiene fórmulas con datos fijos que afectan el resumen (la fórmula del saldo en Seguimiento da negativo para pacientes sin plan, el nombre de un paciente y el mes "septiembre" escritos a mano en Resumen mensual). ¿Lizbany autoriza corregirlos?
