# Ejemplo de stack: n8n

## Cuándo aplica
Para automatizaciones, integración entre herramientas y procesos internos.

## Riesgos típicos
- nodos que corren con credenciales demasiado amplias
- errores silenciosos en cron o webhooks
- flujos sin idempotencia
- tocar producción desde un workflow mal probado

## Mínimo que deberías tener
- credenciales separadas y bien nombradas
- logs o historial de ejecuciones revisable
- backups/export de workflows
- entorno de prueba si el flujo es sensible

## Checklist rápida
- [ ] workflow exportado antes del cambio
- [ ] credenciales revisadas
- [ ] trigger probado de forma controlada
- [ ] acciones destructivas protegidas
- [ ] rollback: versión previa del workflow disponible

## Prompt seguro para IA
```text
Proyecto n8n.
Quiero modificar solo este workflow o estos nodos.
No cambies credenciales ni lógica crítica fuera del alcance.
Explica impacto, validación, prueba y rollback.
```
