# Ejemplo de stack: Python

## Cuándo aplica
Para scripts, APIs, automatizaciones, ETL o herramientas internas.

## Riesgos típicos
- dependencias sin fijar
- scripts que borran o modifican datos sin control
- variables sensibles metidas en código
- cambios sin entorno virtual reproducible

## Mínimo que deberías tener
- `requirements.txt` o equivalente
- `.env` para secretos
- backup o copia si toca datos reales
- comando claro para ejecutar y validar

## Checklist rápida
- [ ] entorno reproducible
- [ ] secretos fuera del código
- [ ] script probado con datos no críticos primero
- [ ] logs revisables
- [ ] rollback o reversión manual definida

## Prompt seguro para IA
```text
Proyecto Python.
Quiero cambiar solo [script/modulo concreto].
No toques dependencias, base de datos o cron salvo necesidad real.
Dime impacto, archivos afectados, validación y rollback.
```
