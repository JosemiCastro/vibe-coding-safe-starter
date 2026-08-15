# Checklist: SaaS con usuarios

## Antes del cambio
- [ ] sé qué usuarios y roles pueden verse afectados
- [ ] hay backup reciente si toca datos
- [ ] tengo usuario de prueba por rol
- [ ] sé qué versión era la última buena

## Seguridad
- [ ] login probado
- [ ] permisos revisados en backend
- [ ] un usuario no puede ver datos de otro
- [ ] panel admin protegido
- [ ] logs sin tokens ni datos personales innecesarios

## Flujos
- [ ] alta o invitación funciona
- [ ] login y logout funcionan
- [ ] recuperación de contraseña funciona si existe
- [ ] flujo principal probado de principio a fin
- [ ] edición y borrado validados si existen

## Deploy y rollback
- [ ] plan de rollback definido
- [ ] logs accesibles
- [ ] sé qué comprobar en los primeros 5 minutos
- [ ] migraciones separadas y revisadas si aplica
