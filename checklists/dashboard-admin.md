# Checklist: dashboard admin

## Acceso
- [ ] autenticación obligatoria
- [ ] permisos validados en backend
- [ ] usuario normal recibe acceso denegado
- [ ] rutas admin no dependen solo de estar ocultas

## Datos
- [ ] filtros y paginación probados
- [ ] exports/imports probados si existen
- [ ] acciones masivas muestran alcance
- [ ] datos sensibles minimizados

## Acciones críticas
- [ ] borrar requiere confirmación
- [ ] cambios importantes dejan auditoría si aplica
- [ ] rollback o recuperación definidos
- [ ] errores no muestran detalles internos

## Deploy
- [ ] login admin funciona
- [ ] usuario sin permisos recibe 403
- [ ] flujo crítico probado
- [ ] logs accesibles
