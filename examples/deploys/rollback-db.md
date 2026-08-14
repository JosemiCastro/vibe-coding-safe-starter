# Ejemplo de despliegue: cambio con base de datos

## Escenario
Hay cambio de esquema, migración o borrado potencial.

## Antes del deploy
- backup de base de datos confirmado
- migración revisada
- plan de rollback definido
- impacto documentado

## Deploy
1. ejecuta migración
2. despliega app
3. valida flujo afectado
4. revisa logs y errores de DB

## Rollback
Si falla:
1. para cambios adicionales
2. vuelve a versión anterior de la app
3. restaura backup o ejecuta rollback de migración si está previsto
4. valida integridad mínima
