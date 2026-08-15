# Checklist: integración con API externa

## Acceso
- [ ] la clave está fuera del código
- [ ] usa permisos mínimos
- [ ] sé cómo rotarla
- [ ] local, staging y producción usan credenciales separadas

## Comportamiento
- [ ] hay timeout
- [ ] los errores no rompen toda la app
- [ ] hay control de reintentos
- [ ] una repetición no duplica acciones
- [ ] sé qué pasa si la API está caída

## Datos
- [ ] no envío más datos de los necesarios
- [ ] logs no muestran tokens ni datos sensibles
- [ ] conozco límites y rate limits

## Antes de desplegar
- [ ] pruebo respuesta correcta
- [ ] pruebo error 401/403
- [ ] pruebo error 429
- [ ] pruebo timeout o caída
