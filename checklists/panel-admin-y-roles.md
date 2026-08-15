# Checklist: panel admin y roles

## Acceso
- [ ] el panel requiere autenticación
- [ ] el backend valida permisos
- [ ] ocultar un botón no es la única protección
- [ ] un usuario normal no puede llamar endpoints admin

## Roles
- [ ] cada rol tiene permisos definidos
- [ ] pruebo el rol con menos privilegios
- [ ] pruebo acceso denegado
- [ ] cambios de rol quedan registrados si son sensibles

## Acciones críticas
- [ ] borrar pide confirmación
- [ ] acciones masivas muestran alcance
- [ ] existe rollback o recuperación cuando aplica
- [ ] logs no exponen datos sensibles

## Antes de desplegar
- [ ] login admin funciona
- [ ] usuario sin permisos recibe 403
- [ ] flujo crítico funciona con el rol correcto
