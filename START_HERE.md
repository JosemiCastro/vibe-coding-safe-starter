# Empieza aquí: 5 minutos antes de construir

No necesitas leer todo el repo ahora. Haz estas cinco cosas primero.

> **Atajo con IA:** si has abierto este proyecto con Claude Code, usa `/vibe-coding-safe`. En Codex, menciona `$vibe-coding-safe` o selecciónala desde `/skills`. La skill te guiará, pero tú debes revisar sus decisiones y resultados.

## 1. Protege tus claves

- usa `.env`
- comprueba que `.env` está en `.gitignore`
- nunca pongas claves en React, HTML público, README, capturas o commits

Lee: [Dónde NO guardar claves](docs/10-donde-no-guardar-claves.md)

## 2. Guarda un estado bueno

```bash
git add .
git commit -m "estado estable antes del cambio"
```

Si no sabes volver a este punto, todavía no hagas un cambio grande.

## 3. Pide una sola cosa a la IA

```text
Proyecto [stack].
Quiero cambiar solo [zona concreta].
No toques auth, base de datos ni deploy.
Devuélveme archivos afectados, riesgos, prueba y rollback.
```

Usa: [Plantilla segura de prompt](examples/SAFE_PROMPT_TEMPLATE.md)

## 4. Antes de desplegar

Completa: [Pre-Deploy Checklist](templates/PRE_DEPLOY_CHECKLIST.md)

Detente si:
- no entiendes el cambio
- no tienes backup
- no sabes revertir
- la IA tocó más archivos de los esperados

## 5. Si algo falla

1. para cambios nuevos
2. guarda logs
3. vuelve a la última versión buena
4. valida el flujo principal
5. documenta el incidente

Usa:
- [Plan de rollback](templates/ROLLBACK_PLAN.md)
- [Informe de incidente](templates/INCIDENT_REPORT.md)

## Ruta recomendada después

1. [Cuándo NO desplegar](docs/11-cuando-no-desplegar.md)
2. [Cómo revertir](docs/12-como-revertir.md)
3. [Cómo pedir cambios pequeños](docs/13-como-pedir-cambios-pequenos-a-la-ia.md)
4. [Cómo no perder la base de datos](docs/14-como-no-perder-la-base-de-datos.md)
