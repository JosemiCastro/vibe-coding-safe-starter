# Ejemplo de stack: React + Node + Postgres

## Cuándo aplica
Para apps con frontend separado y backend API propio.

## Riesgos típicos
- CORS mal resuelto
- variables mezcladas entre frontend y backend
- auth validada solo en frontend
- deploy de frontend bien, backend roto

## Mínimo que deberías tener
- `.env` separado para frontend y backend
- validación en backend
- backup de la base de datos
- healthcheck o forma simple de verificar backend
- changelog mínimo antes de deploy

## Checklist rápida
- [ ] `VITE_*` o variables de cliente no exponen secretos
- [ ] backend valida auth y permisos
- [ ] conexión a Postgres comprobada
- [ ] flujo principal probado extremo a extremo
- [ ] rollback de backend definido

## Prompt seguro para IA
```text
Proyecto React + Node + Postgres.
Quiero cambiar solo [zona concreta].
Toca únicamente frontend [o backend] salvo que sea imprescindible.
No cambies auth ni esquema de base de datos.
Dime archivos afectados, riesgos, validación y rollback.
```
