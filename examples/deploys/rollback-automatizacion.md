# Ejemplo de despliegue: automatización o n8n

## Escenario
Cambias un workflow, cron o automatización que puede dispararse sola.

## Antes del deploy
- export del workflow o copia del script
- credenciales revisadas
- trigger controlado
- acciones destructivas identificadas

## Deploy
1. publica el cambio
2. lanza prueba manual si es posible
3. revisa historial de ejecución

## Rollback
Si falla:
1. desactiva trigger
2. restaura versión anterior del workflow o script
3. valida que no queda nada ejecutándose por error
4. documenta incidente
