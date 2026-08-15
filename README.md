# Vibe Coding Safe Starter

[![quality](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/quality.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/quality.yml)
[![secret-scan](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml)

[English version](./README.en.md)

Guía práctica para construir software con IA sin romper producción, filtrar claves o perder datos.

No intenta enseñarte teoría básica de programación. Te da **criterio operativo**, checklists, plantillas y scripts para trabajar con Claude Code, Codex y otros agentes con más control.

## Empieza aquí

Puedes leerlo directamente en GitHub o clonarlo:

```bash
git clone https://github.com/JosemiCastro/vibe-coding-safe-starter.git
cd vibe-coding-safe-starter
```

¿Tienes cinco minutos? Sigue esta ruta:

1. abre [START_HERE.md](./START_HERE.md)
2. completa el [Project Brief](./templates/PROJECT_BRIEF.md)
3. usa la [plantilla de prompt seguro](./examples/SAFE_PROMPT_TEMPLATE.md)
4. antes de publicar, completa el [Pre-Deploy Checklist](./templates/PRE_DEPLOY_CHECKLIST.md)
5. deja preparado el [Rollback Plan](./templates/ROLLBACK_PLAN.md)

## También funciona como skill de Claude Code y Codex

Si clonas el repositorio o lo usas como plantilla, ambos agentes detectan la misma guía de seguridad dentro del proyecto:

| Agente | Ubicación |
|---|---|
| Claude Code | [`.claude/skills/vibe-coding-safe/SKILL.md`](./.claude/skills/vibe-coding-safe/SKILL.md) |
| Codex | [`.agents/skills/vibe-coding-safe/SKILL.md`](./.agents/skills/vibe-coding-safe/SKILL.md) |

Para un principiante no requiere configurar prompts largos:

- en Claude Code, usa `/vibe-coding-safe`;
- en Codex, menciona `$vibe-coding-safe` o selecciónala desde `/skills`;
- ambos pueden activarla automáticamente al detectar una tarea de código, datos, secretos, backup o despliegue.

La skill guía al agente para inspeccionar antes de editar, reducir el cambio, proteger secretos y datos, preparar rollback y verificar resultados reales. Sigue siendo una ayuda: debes revisar sus decisiones y resultados.

## Detente si ocurre cualquiera de estas cosas

- no entiendes qué ha cambiado
- la IA ha tocado más archivos de los esperados
- hay datos reales y no tienes backup verificado
- no sabes volver a la versión anterior
- el deploy es tu única forma de saber si funciona

## Elige lo que necesitas

| Necesidad | Recurso |
|---|---|
| Proteger claves | [Dónde NO guardar claves](./docs/10-donde-no-guardar-claves.md) |
| Decidir si desplegar | [Cuándo NO desplegar](./docs/11-cuando-no-desplegar.md) |
| Preparar una vuelta atrás | [Cómo revertir](./docs/12-como-revertir.md) |
| Pedir cambios pequeños | [Cómo pedir cambios a la IA](./docs/13-como-pedir-cambios-pequenos-a-la-ia.md) |
| Proteger datos | [Cómo no perder la base de datos](./docs/14-como-no-perder-la-base-de-datos.md) |
| Usar Claude Code | [Guía de Claude Code](./docs/07-claude-code.md) |
| Usar Codex | [Guía de Codex](./docs/08-codex.md) |
| Elegir agente | [Claude Code vs Codex](./docs/09-claude-code-vs-codex.md) |

## Flujo seguro recomendado

```text
Estado bueno → cambio pequeño → revisión → prueba → backup → deploy → validación
       ↑                                                               ↓
       └──────────────────────── rollback si falla ─────────────────────┘
```

1. guarda un estado bueno con Git
2. pide una sola modificación concreta
3. revisa archivos afectados y riesgos
4. prueba el caso exacto
5. crea y verifica backup si toca datos
6. despliega con rollback preparado
7. valida el flujo principal y los logs

## Checklists por tipo de proyecto

- [SaaS con usuarios](./checklists/saas-con-usuarios.md)
- [Automatización interna](./checklists/automatizacion-interna.md)
- [Landing o web corporativa](./checklists/landing-web.md)
- [Dashboard admin](./checklists/dashboard-admin.md)
- [Panel admin y roles](./checklists/panel-admin-y-roles.md)
- [Pagos y suscripciones](./checklists/pagos-y-suscripciones.md)
- [Migración de base de datos](./checklists/migracion-base-de-datos.md)
- [Integración con API externa](./checklists/api-externa.md)

## Casos prácticos de deploy y rollback

- [Login roto después de un cambio](./examples/deploys/rollback-simple.md)
- [Migración o base de datos fallida](./examples/deploys/rollback-db.md)
- [Automatización disparando de más](./examples/deploys/rollback-automatizacion.md)
- [Landing o formulario roto](./examples/deploys/rollback-landing.md)

## Ejemplos por stack

- [React + Node + Postgres](./examples/stacks/react-node.md)
- [Next.js](./examples/stacks/nextjs.md)
- [n8n](./examples/stacks/n8n.md)
- [Python](./examples/stacks/python.md)

## Plantillas operativas

- [Project Brief](./templates/PROJECT_BRIEF.md)
- [Pre-Deploy Checklist](./templates/PRE_DEPLOY_CHECKLIST.md)
- [Rollback Plan](./templates/ROLLBACK_PLAN.md)
- [Incident Report](./templates/INCIDENT_REPORT.md)
- [Changelog](./templates/CHANGELOG.md)

## Scripts de ejemplo

> Son ejemplos educativos. Léelos, adáptalos y pruébalos fuera de producción.

```bash
# Comprobar estructura y scripts del repo
./scripts/validate-repo.sh

# Crear backup; excluye .env por defecto
APP_ROOT=/ruta/proyecto BACKUP_ROOT=/ruta/externa ./scripts/backup-example.sh

# Solo si aceptas expresamente un backup sin el dump solicitado
ALLOW_PARTIAL_BACKUP=true APP_ROOT=/ruta/proyecto ./scripts/backup-example.sh

# Verificar checksums y legibilidad
./scripts/verify-backup-example.sh /ruta/al/backup

# Chequeo previo a deploy
APP_ROOT=/ruta/proyecto ./scripts/predeploy-check-example.sh
```

## Seguridad

- Gitleaks revisa secretos en pushes y pull requests.
- El workflow `quality` valida estructura, enlaces locales y sintaxis Bash.
- Consulta [SECURITY.md](./SECURITY.md) antes de reportar una clave o vulnerabilidad.

## Contribuir

Las contribuciones deben resolver un problema práctico, incluir un ejemplo verificable y no contener secretos. Lee [CONTRIBUTING.md](./CONTRIBUTING.md) y consulta los cambios publicados en [CHANGELOG.md](./CHANGELOG.md).

## Licencia

MIT. Consulta [LICENSE](./LICENSE).
