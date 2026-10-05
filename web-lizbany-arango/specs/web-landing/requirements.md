# Documento de Requisitos: Web de Lizbany Arango (landing de una página)

## Introducción

Sitio web estático de una sola página para Ps. Lizbany Arango, psicóloga clínica. Su objetivo es transmitir un acompañamiento cálido y con base científica a personas de 20 a 40 años y llevarlas a dar el primer paso: escribir por WhatsApp para agendar una cita virtual. La web ya existe; esta spec documenta el comportamiento esperado para validarlo y servir de base de futuros cambios.

## Supuestos

- La conversión principal es el contacto por WhatsApp; Instagram y correo son canales secundarios.
- El sitio es 100 % estático (HTML, CSS, JS sin build), alojado en Apache/LiteSpeed (Hostinger), según el `.htaccess`.
- Las citas son solo virtuales, de 60 minutos; no hay agendamiento en línea ni pagos en la web.
- El contenido está solo en español.
- Los textos de marca viven en `lib/manifest.js` (`window.__BRAND__`) y en `index.html`.

## Glosario

- **Landing**: la página única con todas las secciones.
- **CTA**: botón de llamada a la acción para agendar la cita.
- **Enlace de WhatsApp**: `https://wa.me/573126376866` con el mensaje "Hola Liz, quiero agendar una cita.".
- **Reveal**: animación de aparición de un elemento al entrar en pantalla.

## Requisitos

### Requisito 1: Propuesta de valor inmediata (hero)

**Historia de usuario:** Como visitante, quiero entender en segundos quién es Lizbany y qué ofrece, para decidir si seguir leyendo.

#### Criterios de aceptación

1. WHEN la página carga THE SYSTEM SHALL mostrar sin hacer scroll el kicker "Psicología clínica · Citas virtuales", el titular, el subtítulo y dos botones: "Agenda tu cita" y "Conocer el enfoque".
2. WHEN la página carga THE SYSTEM SHALL precargar la imagen del hero con prioridad alta.
3. WHEN el visitante pulsa "Conocer el enfoque" THE SYSTEM SHALL desplazar la vista a la sección Enfoque.
4. WHEN la imagen del hero se muestra THE SYSTEM SHALL ofrecer un texto alternativo descriptivo y mantener el texto legible sobre la imagen.

### Requisito 2: Navegación

**Historia de usuario:** Como visitante, quiero moverme fácilmente entre secciones, para encontrar la información que busco.

#### Criterios de aceptación

1. THE SYSTEM SHALL mostrar una barra superior fija con la marca y los enlaces Enfoque, Acompañamiento, Reflexiones y Contacto, más el botón "Agenda tu cita".
2. WHEN el visitante pulsa un enlace interno (`#...`) THE SYSTEM SHALL desplazar la vista a esa sección dejando un margen de 84 px para que la barra no tape el título.
3. WHEN el visitante ha hecho scroll más de 12 px THE SYSTEM SHALL cambiar la barra a su estado sólido.
4. WHEN el visitante usa el teclado THE SYSTEM SHALL ofrecer un enlace "Saltar al contacto" como primer elemento enfocable.
5. WHILE el sistema operativo tenga activada la reducción de movimiento THE SYSTEM SHALL desplazarse sin animación.

### Requisito 3: Presentar el enfoque y los servicios

**Historia de usuario:** Como visitante, quiero conocer el enfoque terapéutico y en qué temas me puede ayudar, para saber si es lo que necesito.

#### Criterios de aceptación

1. THE SYSTEM SHALL incluir una sección Enfoque que explique el enfoque cognitivo-conductual y las terapias contextuales.
2. THE SYSTEM SHALL incluir una sección "Espacios de acompañamiento" con cuatro tarjetas: Ansiedad y preocupación, Autoexigencia y perfeccionismo, Relaciones interpersonales y Adaptación a cambios.
3. THE SYSTEM SHALL mostrar en cada tarjeta un icono decorativo, un título y una descripción de una frase.
4. THE SYSTEM SHALL incluir una sección "Mi compromiso" con una cita destacada.

### Requisito 4: Reflexiones

**Historia de usuario:** Como visitante, quiero leer ideas breves de la psicóloga, para sentir su forma de pensar antes de escribirle.

#### Criterios de aceptación

1. THE SYSTEM SHALL mostrar una sección Reflexiones con tres tarjetas de cita, cada una con su fuente en el pie.
2. WHEN una cita es de un tercero (ej. Viktor Frankl) THE SYSTEM SHALL atribuirla en el pie.

### Requisito 5: Modalidad y contacto

**Historia de usuario:** Como visitante, quiero saber cómo son las sesiones y cómo empezar, para contactar sin dudas.

#### Criterios de aceptación

1. THE SYSTEM SHALL describir la modalidad: sesiones virtuales de 60 minutos, espacio confidencial y primer contacto por WhatsApp.
2. WHEN el visitante pulsa cualquier CTA de cita (barra, hero, contacto, pie) THE SYSTEM SHALL abrir en una pestaña nueva el enlace de WhatsApp con el mensaje precargado, sin pasar `opener` a la página destino.
3. THE SYSTEM SHALL mostrar en la sección Contacto el botón "Escribir por WhatsApp", el perfil de Instagram `@ps.lizbanyarango` y el correo `ps.lizbanyarango@gmail.com`.
4. WHEN el visitante pulsa el correo THE SYSTEM SHALL abrir su cliente de correo con el destinatario relleno.
5. THE SYSTEM SHALL mostrar un aviso de que el sitio no reemplaza la atención de urgencias en salud mental y que, en caso de crisis, se contacte la línea de emergencia local.

### Requisito 6: Diseño adaptable

**Historia de usuario:** Como visitante que navega desde el celular, quiero que la web se vea y funcione bien en mi pantalla.

#### Criterios de aceptación

1. THE SYSTEM SHALL adaptar el diseño a anchos desde 320 px hasta escritorio (puntos de corte en 540, 720, 960 y 1280 px).
2. WHEN la pantalla tiene menos de 320 px útiles THE SYSTEM SHALL evitar el desplazamiento horizontal.
3. WHILE el ancho de pantalla sea menor de 720 px THE SYSTEM SHALL mostrar los botones (`.btn`) con una altura mínima de 44 px y los enlaces de navegación y contacto con un área táctil de al menos 24 × 24 px.

### Requisito 7: Animaciones y degradación elegante

**Historia de usuario:** Como visitante, quiero una experiencia fluida, pero que el contenido siempre sea accesible.

#### Criterios de aceptación

1. WHEN un elemento `.reveal` entra en pantalla THE SYSTEM SHALL mostrarlo con una animación de aparición.
2. IF JavaScript no está disponible, el navegador no soporta `IntersectionObserver` o una inicialización falla THEN THE SYSTEM SHALL mostrar todo el contenido visible, sin animaciones.
3. IF un elemento `.reveal` no se ha mostrado a los 6 segundos y está dentro de la pantalla THEN THE SYSTEM SHALL mostrarlo.
4. WHILE el visitante prefiera movimiento reducido THE SYSTEM SHALL desactivar las animaciones de aparición.
5. WHEN el visitante hace scroll THE SYSTEM SHALL mover las líneas botánicas decorativas con un desplazamiento máximo de 24 px.

### Requisito 8: Rendimiento, SEO y accesibilidad

**Historia de usuario:** Como psicóloga, quiero que la web cargue rápido y aparezca bien en buscadores y al compartirla, para atraer pacientes.

#### Criterios de aceptación

1. THE SYSTEM SHALL definir `lang="es"`, un `<title>` y una meta description coherentes con la marca.
2. THE SYSTEM SHALL servir las imágenes en WebP con `width` y `height` declarados para evitar saltos de diseño.
3. THE SYSTEM SHALL marcar los elementos puramente decorativos con `aria-hidden="true"` y estructurar los títulos en orden jerárquico (un único `h1`).
4. WHEN el sitio se despliega THE SYSTEM SHALL servir HTML, CSS y JS con revalidación en cada visita, e imágenes con caché de un mes (vía `.htaccess`).
5. THE SYSTEM SHALL mantener un contraste de texto de al menos 4.5:1 en texto normal.
6. THE SYSTEM SHALL registrar la autoría de cada imagen en `assets/credits.json`.

## Requisitos no funcionales

- Sin dependencias de build ni backend; solo GSAP/ScrollTrigger locales y Google Fonts (Fraunces, Work Sans, Lora).
- Sin recopilación de datos personales ni formularios en el sitio.
- Compatible con las dos últimas versiones de Chrome, Safari, Firefox y Edge.

## Brechas conocidas (código actual vs. requisitos)

- **Req. 7.4:** hoy los reveals (`opacity`/`transform`) siguen animándose con `prefers-reduced-motion: reduce`; solo se desactivan el scroll suave y el `scroll-cue`. Ver `design.md`, "Riesgos y decisiones pendientes".
- **Req. 6.3:** pendiente de medir la altura real de `.btn-compact` y de los enlaces de `.nav-links` (hoy con `padding-block: 0.3rem`) en móvil.

## Fuera de alcance

- Agendamiento en línea, pagos, blog y área de pacientes.
- Formulario de contacto propio y analítica.
- Versión en otros idiomas.
- Rediseño visual de la marca.

## Preguntas abiertas

- ¿Se añadirá una página de política de privacidad / consentimiento (usual en servicios de salud)?
- ¿Se quiere metadatos para compartir en redes (Open Graph) y analítica de clics en WhatsApp?
- ¿Hay testimonios, tarifas o formación/credenciales de la psicóloga que deban aparecer?
- ¿Las secciones Enfoque y Reflexiones deben leer su texto de `lib/manifest.js` o seguir en el HTML?
