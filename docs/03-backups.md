# Backups: lo mínimo serio

## Qué deberías respaldar
Depende del proyecto, pero normalmente:

- base de datos
- variables de entorno
- ficheros subidos por usuarios
- configuración del servidor o panel
- repositorio git

## Frecuencia mínima
### App pequeña con datos reales
- base de datos: diario
- uploads: diario
- `.env` y configuración: cada cambio

### App con mucho movimiento
- base de datos: varias veces al día
- assets/uploads: según volumen

## Regla práctica
Antes de:

- migraciones
- deploys grandes
- refactors con riesgo
- cambios en auth
- cambios de infraestructura

haz backup manual adicional.

## Qué debe incluir un buen backup
- fecha
- origen
- destino
- responsable
- prueba de restauración

## Error típico
"Tenemos copia en el servidor".
Eso no vale si el servidor muere.
Necesitas copia fuera del servidor principal.

## Verificación
Una vez al mes como mínimo:

- restaura una copia en entorno aparte
- comprueba que abre
- valida tablas o archivos clave

## Objetivo
No tener backups "por si acaso".
Tener backups que te permitan volver a operar.
