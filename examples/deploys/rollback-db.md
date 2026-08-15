# Caso realista: migración lanzada y error en base de datos

## Escenario
Había que añadir una columna, cambiar esquema o tocar una tabla.
Tras el deploy, la app deja de responder bien o aparecen errores de DB.

## Antes del deploy
- backup de base de datos confirmado
- migración revisada
- plan de rollback definido
- sabes qué versión era la última buena
- validación mínima preparada

## Qué revisar nada más publicar
1. ¿la app conecta?
2. ¿la migración terminó completa?
3. ¿faltan columnas, tablas o índices esperados?
4. ¿hay errores nuevos en logs de DB o app?

## Si falla
1. detén cambios adicionales
2. vuelve a la versión anterior de la app
3. aplica rollback de migración si existe o restaura backup
4. valida login, lectura y escritura mínimas
5. documenta el incidente antes de volver a intentarlo

## Qué NO hacer
- lanzar otra migración “rápida” encima
- asumir que con volver el código basta si los datos ya cambiaron
- tocar producción sin confirmar backup restaurable

## Señal de que debiste frenar antes
Si no podías explicar cómo recuperar la integridad de la base en pocos pasos, no estabas listo para desplegar ese cambio.
