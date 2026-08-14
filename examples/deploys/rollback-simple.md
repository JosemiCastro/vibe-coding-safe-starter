# Ejemplo de despliegue: cambio pequeño con rollback simple

## Escenario
Cambias un formulario o un endpoint pequeño.

## Antes del deploy
- commit limpio
- backup si toca datos
- variables revisadas
- prueba local o en staging si existe

## Deploy
1. despliega el cambio
2. revisa logs
3. prueba el flujo afectado

## Rollback
Si falla:
1. vuelve al commit anterior o imagen anterior
2. redeploy
3. valida login o flujo principal
4. documenta incidente
