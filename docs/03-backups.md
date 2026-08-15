# Backups: lo mínimo serio

La pregunta no es si haces backup.
La pregunta es si podrías restaurar hoy sin inventarte nada.

## Qué deberías respaldar
Depende del proyecto, pero normalmente:
- base de datos
- variables de entorno
- ficheros subidos por usuarios
- configuración del servidor o panel
- repositorio git
- exports de workflows si usas automatizaciones

## Frecuencia mínima
### App pequeña con datos reales
- base de datos: diario
- uploads: diario
- `.env` y configuración: cada cambio

### App con mucho movimiento
- base de datos: varias veces al día
- assets/uploads: según volumen
- exports/config crítica: tras cada cambio sensible

## Haz backup extra antes de
- migraciones
- deploys grandes
- refactors con riesgo
- cambios en auth
- cambios de infraestructura
- tocar workflows que disparan acciones reales

## Qué debe incluir un buen backup
- fecha
- origen
- destino
- responsable
- alcance
- prueba de restauración

## Error típico
"Tenemos copia en el servidor".
Eso no vale si el servidor muere, se corrompe o borras justo esa carpeta.
Necesitas copia fuera del servidor principal.

## Cómo validar que sirve
Una vez al mes como mínimo:
- restaura una copia en entorno aparte
- comprueba que abre
- valida tablas o archivos clave
- confirma que sabes repetir el proceso

## Señales de mala estrategia
- nadie sabe dónde está la última copia buena
- el backup depende de una persona concreta
- no sabes de cuándo es la última copia
- nunca has restaurado una

## Checklist mínima
- [ ] hay copia reciente
- [ ] está fuera del servidor principal
- [ ] sabes restaurarla
- [ ] sabes qué cubre y qué no cubre

## Regla final
No tengas backups “por si acaso”.
Ten backups que te permitan volver a operar.