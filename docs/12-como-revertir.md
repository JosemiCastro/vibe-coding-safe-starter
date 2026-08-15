# Cómo revertir

Rollback no es una palabra bonita para quedar técnico.
Rollback es lo que evita que un error de 10 minutos te arruine una tarde entera.

## Antes de cambiar nada
Deberías tener al menos una de estas opciones:
- commit anterior claro
- imagen anterior desplegable
- backup reciente
- export del workflow o configuración anterior

## Formas simples de revertir

### Código
- volver al commit anterior
- redeploy de la versión anterior
- recuperar el último estado bueno etiquetado

### Base de datos
- restaurar backup
- aplicar rollback de migración si existe
- parar cambios nuevos mientras recuperas integridad

### n8n o automatizaciones
- desactivar trigger
- restaurar export previo
- volver al workflow anterior
- comprobar si quedó algo ejecutándose a medias

## Lo que deberías escribir antes del deploy
- qué cambio entra
- qué versión estaba bien antes
- cómo se vuelve atrás
- cuánto tardas en hacerlo
- qué comprobarás después

## Señal de alerta
Si tu rollback depende de improvisar comandos cuando todo ya está roto, no tienes rollback.

## Plantilla mínima
Antes de desplegar, escribe algo como:

```text
Si falla, vuelvo al commit abc123 o a la imagen anterior.
Después pruebo login, home y flujo principal.
```

## Qué probar después de revertir
- que la app abre
- que el login funciona si existe
- que el flujo principal no está roto
- que no has dejado un proceso a medias
- que los logs no muestran nuevos errores graves

## Error típico
Pensar que rollback es "ya lo arreglaré rápido".
Eso no es rollback. Eso es confiar en que no haya presión cuando falle.

## Regla final
No despliegues nada que no sepas deshacer con más claridad de la que usaste para crearlo.