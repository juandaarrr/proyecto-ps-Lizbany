# Guía para dejar el proyecto funcionando en el computador de Lizbany

Esta guía no contiene datos de pacientes. El Excel con los datos **no se descarga de GitHub**: se pasa aparte (paso 4).

## Qué necesita su computador

| Programa | Para qué | Cómo comprobarlo |
|---|---|---|
| **Windows 10 u 11** | Es donde funciona la automatización del Excel | — |
| **Microsoft Excel de escritorio** (no la versión web) | El programa abre el archivo con Excel para no dañar fórmulas, listas ni gráficos | Abrir Excel desde el menú Inicio |
| **Git para Windows** | Descargar el proyecto | `git --version` en una terminal |
| **Python 3** (con la casilla "Add to PATH") | Verificar el archivo y armar el resumen | `python --version` |
| **Claude** (app de escritorio o Claude Code) con cuenta iniciada | Es el chat donde Liz envía sus datos | Abrir la app |

Después de instalar Python, una sola vez, en una terminal:

```bash
pip install openpyxl
```

## Pasos

1. **Instalar lo anterior** (si ya lo tiene, saltar).
2. **Descargar el proyecto.** En una terminal (Git Bash o PowerShell), en la carpeta donde quiera guardarlo, por ejemplo `Documentos`:

   ```bash
   git clone https://github.com/juandaarrr/proyecto-ps-Lizbany.git
   ```

   Como el repositorio es público no pide usuario ni contraseña. Se crea la carpeta `proyecto-ps-Lizbany`.
3. **Abrir esa carpeta en Claude** (en Claude Code: abrir la carpeta `proyecto-ps-Lizbany` como proyecto). Claude lee solo el archivo `CLAUDE.md` y los skills de la carpeta `.claude/skills/`.
4. **Pasar el Excel** (esto se hace aparte, nunca por GitHub). Copiar la carpeta `CUADRO CONTROL` completa, con `Control_Terapias_Lizbany.xlsx` dentro, **dentro** de `proyecto-ps-Lizbany`. Debe quedar así:

   ```
   proyecto-ps-Lizbany/
   └── CUADRO CONTROL/
       └── Control_Terapias_Lizbany.xlsx
   ```

   Se puede pasar con una memoria USB o compartiendo la carpeta por OneDrive. No se envía por correo ni por WhatsApp sin cuidado: tiene nombres y pagos reales.
5. **Comprobar que todo quedó bien.** En una terminal dentro de `proyecto-ps-Lizbany`:

   ```bash
   python ".claude/skills/control-semanal-terapias/scripts/verificar-y-resumir.py" "CUADRO CONTROL/Control_Terapias_Lizbany.xlsx" --solo-verificar
   ```

   Debe terminar con `VERIFICACION: TODO BIEN`. Si dice que falta algo, no sigas y avísale a quien configuró el proyecto.

## Una sola copia oficial del Excel

**Desde el día que se pasa el archivo, la copia de Liz es la oficial.** Si se sigue editando la copia del otro computador, las dos se desordenan y se pierde información. El otro computador se conserva solo como archivo histórico.

## Primera vez: ponerlo al día

El último registro es del **15/09/2026**. Liz debe ponerlo al día **hasta el domingo 04/10/2026**, y desde el **viernes 09/10/2026** continúa cada viernes.

1. Cerrar el Excel (Claude no puede escribir si está abierto).
2. Abrir el proyecto en Claude y escribir, con sus palabras, algo como:

   > Hola, soy Liz. Quiero poner al día mi control de terapias desde el 16/09 hasta el 4 de octubre.

3. Claude le pedirá las sesiones y pagos con un mensaje tipo. No tiene que quedar perfecto: si algo no se entiende, **Claude pregunta antes de registrar**. También le pedirá confirmar los precios (consulta $110.000, diagnóstico $90.000, paquete de 4 consultas $380.000).
4. Al final recibe un resumen de lo que ingresó. Después puede abrir el Excel y ver la hoja **Panel**, con los gráficos.

## Cada viernes

Cerrar el Excel, abrir el proyecto en Claude, enviar lo ocurrido desde el viernes anterior y recibir el resumen.

## Si algo falla

- **"El archivo está abierto":** cerrar Excel y repetir.
- **El programa no encuentra Python o `openpyxl`:** repetir la instalación del principio.
- **Algo se ve raro en el Excel:** no editarlo a mano. Claude guarda un respaldo antes de cada cambio en `CUADRO CONTROL/respaldos/` y puede restaurarlo.
