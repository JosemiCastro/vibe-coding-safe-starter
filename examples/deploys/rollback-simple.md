# Caso realista: tocaste un login y rompiste el acceso

## Escenario
Querías cambiar validación o copy en login.
Después del deploy, los usuarios no pueden entrar o el formulario devuelve error.

## Antes del deploy
- commit limpio con el estado bueno
- flujo de login probado antes del cambio
- variables de entorno revisadas
- versión anterior identificada

## Qué revisar nada más publicar
1. ¿carga la página de login?
2. ¿responde el endpoint?
3. ¿hay errores 401, 403, 500 o CORS?
4. ¿cambió algo fuera de login?

## Si falla
No metas otro parche encima corriendo.
Haz esto:
1. para el despliegue o congela cambios nuevos
2. vuelve al commit o imagen anterior
3. redeploy
4. prueba login con un usuario real de prueba
5. documenta qué cambió y qué rompió

## Qué NO hacer
- tocar auth completa sin revisar el diff
- cambiar frontend y backend otra vez antes de volver atrás
- probar en producción a ciegas con usuarios reales

## Señal de que debiste frenar antes
Si para arreglar login cambiaste muchos archivos o tocaste auth general, el cambio ya era demasiado grande.
