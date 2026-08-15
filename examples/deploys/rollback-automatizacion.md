# Caso realista: workflow o automatización disparando de más

## Escenario
Cambiaste un workflow de n8n, un cron o una automatización.
Después del deploy empieza a ejecutarse más veces de la cuenta, manda mensajes repetidos o toca datos por error.

## Antes del deploy
- export del workflow o copia del script
- credenciales revisadas
- trigger controlado
- acciones destructivas identificadas
- versión anterior localizada

## Qué revisar nada más publicar
1. ¿cuántas ejecuciones se están lanzando?
2. ¿qué trigger está activo?
3. ¿se están enviando mensajes, correos o escrituras de más?
4. ¿hay datos afectados ya?

## Si falla
1. desactiva trigger o pausa el workflow
2. restaura versión anterior del workflow o script
3. valida que no queda nada ejecutándose a medias
4. revisa si hay que corregir acciones ya disparadas
5. documenta el incidente

## Qué NO hacer
- dejarlo correr mientras “observas”
- meter otro parche sin pausar primero
- asumir que el problema es visual si ya hay efectos reales

## Señal de que debiste frenar antes
Si no sabías qué acción real iba a ejecutar el workflow ni cómo detenerla rápido, no estaba listo para producción.
