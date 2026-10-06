# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Qué es este repositorio

Proyecto de marca personal de **Ps. Lizbany Arango** (psicóloga clínica, citas virtuales de 60 min, público de 20 a 40 años). No es una aplicación con build: reúne material de marca (imágenes, brochures, ideas de reels y carruseles), una landing estática, un cuestionario BDI-II, documentos de especificación y un flujo de control financiero de terapias en Excel. **No hay build, linter ni tests.** Documentos y mensajes en **español**, con tono sencillo: Lizbany no es técnica.

El repositorio es **público** en GitHub (`juandaarrr/proyecto-ps-Lizbany`, rama `main`). Revisa qué publicas antes de cada `push`.

## Privacidad (lo más importante)

- Están **fuera de git** (`.gitignore`) y viven solo en OneDrive: `CUADRO CONTROL/` (Excel con pacientes y pagos reales, más `respaldos/`), `CERTIFICADOS/` (cédula, tarjeta profesional, diplomas), `LIBROS/`, `REELS FINALES/`, `VIDEOS/` y cualquier video (`*.mp4`, `*.mov`...). Nunca los agregues a git. El historial se reescribió una vez para quitar `CERTIFICADOS/` y los videos: no los vuelvas a introducir.
- **Nunca copies datos de pacientes ni de pagos** a archivos versionados, specs, bitácoras, commits ni mensajes. Habla de pacientes **solo por ID** (P001, P002...), jamás por nombre.
- La spec exige ética profesional en el contenido (Ley 1090 de 2006): sin diagnósticos, promesas de cura ni testimonios de pacientes; tono acogedor y no alarmista.

## Flujo de especificación

Las features se definen con los skills del proyecto: `brainstorming` → `specify`, que escribe `specs/<feature>/requirements.md` (EARS), `design.md` y `tasks.md`, **con aprobación explícita entre cada documento**. `tasks.md` también es la bitácora viva de la implementación (marcar `[~]`/`[x]` solo al cumplir el criterio de terminado, y registrar decisiones sin datos de pacientes). `brainstorming` es una versión modificada de la de `obra/superpowers` y ya no coincide con `skills-lock.json`: `npx skills update` la sobrescribiría. Ambos skills tienen también una copia en `~/.claude/skills/`; si editas uno aquí, copia el cambio.

- **Spec activa:** `specs/plan-marketing-redes/` (plan de marketing en redes de 12 semanas; Req. 1 a 10; la Fase 6 de `tasks.md` es el control financiero). Documentos operativos en `marketing/`.
- La landing tiene su propia spec en `web-lizbany-arango/specs/web-landing/` (sin `tasks.md`).
- Precios vigentes (confirmados 2026-10-06): consulta **$110.000**, diagnóstico **$90.000**, paquete de 4 consultas **$380.000**. `PROYECTO MARCA PERSONAL.docx` trae precios viejos.

## Control financiero de terapias (ciclo de los viernes)

El skill `control-semanal-terapias` (`.claude/skills/control-semanal-terapias/`) mantiene `CUADRO CONTROL/Control_Terapias_Lizbany.xlsx`. Lizbany envía sus sesiones y pagos por el chat cada viernes; Claude valida, registra, verifica y entrega el resumen sin nombres. **Sigue `SKILL.md` en lugar de improvisar.** Semana de lunes a domingo según la fecha de cada fila. Pendiente: la primera puesta al día va del 16/09/2026 al 04/10/2026.

```bash
# validar sin escribir (código 2 = hay PREGUNTAS para Lizbany; no se modifica nada)
powershell -NoProfile -ExecutionPolicy Bypass -File ".claude/skills/control-semanal-terapias/scripts/registrar-semana.ps1" -Path "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx" -Datos "<json fuera del repo>" -SoloValidar
# registrar (hace respaldo en CUADRO CONTROL/respaldos/ y recalcula) = mismo comando sin -SoloValidar
# verificar el archivo y generar el resumen (solo lee)
python ".claude/skills/control-semanal-terapias/scripts/verificar-y-resumir.py" "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx" --hoy AAAA-MM-DD
```

Cosas no obvias del Excel (Excel en español, 7 hojas: Pacientes, Pagos, Seguimiento, Resumen mensual, Resumen semanal, Panel, Hoja1):
- **Escribe solo con Excel por COM** (`registrar-semana.ps1`). `openpyxl` borra la validación avanzada `x14` de Pagos y los 5 gráficos del Panel al guardar.
- Excel debe estar **cerrado**; si el archivo está bloqueado, no lo toques. Siempre respaldo previo; si una verificación falla, restaura el respaldo.
- Seguimiento es solo para pacientes con plan; el saldo de quien no tiene plan es cobrado − recibido (su "Total plan" en 0 es correcto). En un paquete, el valor completo va en "Valor cobrado" de la primera fila y los pagos posteriores son filas nuevas con su fecha. Un abono nunca se asume como pago total.
- `Resumen semanal` cubre 60 semanas desde el lunes 17/08/2026 (hay que extenderla hacia agosto de 2027); el `Panel` toma 4 tablas de apoyo (filas 62 a 130) y un rango con nombre dinámico para el gráfico de saldos.
- Trampas de COM/PowerShell 5.1 aquí: `Names.Add` interpreta la fórmula con sintaxis local (`DESREF`, `CONTAR.SI`, `;`); asignar un `Double` a `.Value2` falla (usa `.Formula` con texto); los `.ps1` con tildes necesitan BOM UTF-8; los nombres como `N1` son direcciones de celda y no valen; exportar a imagen un gráfico fuera de la zona visible sale vacío hasta activarlo.

## Landing (`web-lizbany-arango/`)

Sitio estático sin build: `index.html` + `styles.css` + `main.js` (IIFE con mejoras progresivas) y GSAP/ScrollTrigger locales en `lib/`. `lib/manifest.js` (`window.__BRAND__`) duplica los textos y **ningún script lo consume**: los textos reales viven en `index.html`. Para verla: `python -m http.server` dentro de esa carpeta.

- El contenido es visible sin JS; `reveal-armed` solo lo añade el JS, para que un fallo nunca oculte contenido.
- Despliegue: copiar la carpeta a Apache/LiteSpeed (Hostinger). `.htaccess` revalida HTML/CSS/JS en cada visita y cachea imágenes un mes; al cambiar CSS o JS sube a mano el `?v=AAAAMMDD` en `index.html`.
- Conversión única: enlace `https://wa.me/573126376866` con el mensaje "Hola Liz, quiero agendar una cita." (el mismo en bio y destacados). Sin formularios ni analítica.
- Brecha conocida: los reveals no respetan `prefers-reduced-motion` (Req. 7.4 de su spec). La verificación es manual (ver "Estrategia de pruebas" de su `design.md`).

## Otras piezas

- `index.html` de la **raíz** es otra cosa, no la landing: un cuestionario BDI-II autocontenido que recoge nombre, edad, sexo y respuestas, y las envía a Formspree (endpoint en el código) con respaldo `mailto:` a Lizbany. Es información sensible de salud, y el texto de los ítems es material con derechos de autor: no cambies destinos ni agregues almacenamiento sin consultarlo.
- Identidad de marca (`PROYECTO MARCA PERSONAL.docx`): colores `#D9DD92`, `#776472`, `#DB9065`, `#646F4B`, `#71816D`; tipografías Guía (títulos), Arsenal (subtítulos) y Lustria (texto). La landing usa Fraunces, Work Sans y Lora (Google Fonts).
- `prompt_edicion_reel_lizbany.md` es la base para editar reels. `SKIILS/` (con ese nombre) tiene 9 skills de terceros en formato `.skill` (zip) para redes sociales, **sin instalar**.
- GitHub CLI instalado con winget en `%LOCALAPPDATA%\Microsoft\WinGet\Packages\GitHub.cli_Microsoft.Winget.Source_8wekyb3d8bbwe\bin\gh.exe` (en terminales nuevas ya está en el `PATH`).
