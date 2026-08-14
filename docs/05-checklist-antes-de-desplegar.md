# Checklist antes de desplegar

## Seguridad
- [ ] No hay secretos en código ni en commits
- [ ] `.env` configurado correctamente
- [ ] No se ha abierto nada admin sin login

## Datos
- [ ] Hay backup reciente de la base de datos
- [ ] Si hay uploads, también tienen copia
- [ ] Hay plan de rollback

## Cambio
- [ ] Sabes qué archivos cambia este deploy
- [ ] El cambio está documentado en changelog o nota interna
- [ ] El alcance del cambio es entendible

## Validación
- [ ] Se ha probado el flujo principal
- [ ] Se ha probado login si aplica
- [ ] Se ha probado el caso exacto que se quería arreglar

## Infra
- [ ] Variables de entorno correctas en servidor/panel
- [ ] Dominio y puertos revisados si aplica
- [ ] Logs accesibles tras deploy

## Regla final
Si no puedes explicar en 30 segundos cómo volver atrás, no despliegues todavía.
