# Ejemplo de stack: Next.js

## Cuándo aplica
Para apps full-stack con App Router, server actions, API routes o despliegue único.

## Riesgos típicos
- mezclar lógica cliente y servidor
- filtrar secretos en el bundle
- romper rutas o server actions en deploy
- asumir que un error de hidratación es solo visual

## Mínimo que deberías tener
- separación clara entre código server y client
- variables privadas sin exponer al cliente
- ruta crítica probada tras deploy
- rollback simple al commit anterior o imagen anterior

## Checklist rápida
- [ ] no se expone ninguna key en variables públicas
- [ ] rutas y server actions probadas
- [ ] login probado si existe auth
- [ ] logs accesibles tras deploy
- [ ] rollback preparado

## Prompt seguro para IA
```text
Proyecto Next.js.
Quiero cambiar [flujo concreto].
No conviertas esto en un refactor general.
No toques rutas ni auth salvo necesidad real.
Explica archivos afectados, riesgos, validación y rollback.
```
