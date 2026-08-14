# Vibe Coding Safe Starter

[![secret-scan](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml)

[English version](./README.en.md)

Guía práctica para gente que empieza a construir software con IA sin base fuerte de programación.

La idea no es quitarte las ganas de crear.
La idea es que no rompas producción, no pierdas datos y no conviertas un prototipo en una bola de deuda imposible de mantener.

## Qué problema resuelve

Muchísima gente está construyendo con Claude, Codex, Gemini o herramientas parecidas sin una base sólida de desarrollo.

Eso acelera muchísimo, pero también abre riesgos muy concretos:

- tocar producción sin entender impacto
- subir secretos al repo
- no tener backup real
- desplegar sin rollback
- aceptar refactors enormes que luego nadie sabe mantener
- mezclar velocidad con seguridad

Este repo pone barandillas simples para reducir justo eso.

## Para quién es

- gente que usa IA para construir apps y automatizaciones
- founders, marketers, operators o perfiles no técnicos sacando MVPs
- equipos pequeños que necesitan reglas mínimas antes de desplegar
- personas que quieren usar Claude Code o Codex con criterio, no a ciegas

## Qué encontrarás aquí

- principios operativos para construir con IA sin liarla
- reglas concretas sobre dónde NO guardar claves
- criterios claros sobre cuándo NO desplegar
- guías simples para rollback y reversión
- cómo pedir cambios pequeños a la IA
- cómo no perder la base de datos
- checklist de predeploy
- plantillas para documentar proyectos, cambios e incidentes
- guías específicas para trabajar con Claude Code y Codex

## Filosofía

Si no sabes programar bien todavía, tu mayor riesgo no es escribir mal una función.
Tu mayor riesgo es este:

1. tocar algo sin entender impacto
2. no tener backup
3. meter secretos en código
4. desplegar sin rollback
5. acumular cambios sin documentación

Este repo intenta poner barandillas simples para evitar eso.

## Estructura

### Docs
- `docs/01-principios.md` — reglas base para trabajar con IA sin liarla
- `docs/02-seguridad-basica.md` — secretos, permisos, auth y exposición pública
- `docs/03-backups.md` — qué guardar, con qué frecuencia y cómo comprobarlo
- `docs/04-deuda-tecnica.md` — qué deuda aceptar y cuál no
- `docs/05-checklist-antes-de-desplegar.md` — checklist corto de predeploy
- `docs/06-trabajar-con-ia-sin-romperlo-todo.md` — flujo recomendado de cambios con IA
- `docs/07-claude-code.md` — cómo usar Claude Code con seguridad si estás empezando
- `docs/08-codex.md` — cómo usar Codex con límites y criterio
- `docs/09-claude-code-vs-codex.md` — cuándo usar Claude Code y cuándo usar Codex
- `docs/10-donde-no-guardar-claves.md` — errores típicos al gestionar secretos
- `docs/11-cuando-no-desplegar.md` — señales claras para frenar un deploy
- `docs/12-como-revertir.md` — rollback simple para gente no técnica
- `docs/13-como-pedir-cambios-pequenos-a-la-ia.md` — cómo trocear cambios para no romper la app
- `docs/14-como-no-perder-la-base-de-datos.md` — reglas mínimas para no cargarte la DB

### Templates
- `templates/PROJECT_BRIEF.md` — briefing mínimo de cualquier app
- `templates/PRE_DEPLOY_CHECKLIST.md` — checklist reusable
- `templates/INCIDENT_REPORT.md` — para documentar errores serios
- `templates/CHANGELOG.md` — cambios visibles y trazables

### Examples
- `examples/.env.example` — ejemplo seguro de variables de entorno
- `examples/SAFE_PROMPT_TEMPLATE.md` — plantilla para pedir cambios a la IA con contexto
- `examples/stacks/react-node.md` — base segura para React + Node + Postgres
- `examples/stacks/nextjs.md` — base segura para proyectos Next.js
- `examples/stacks/n8n.md` — base segura para workflows n8n
- `examples/stacks/python.md` — base segura para proyectos Python
- `examples/deploys/rollback-simple.md` — despliegue simple con rollback básico
- `examples/deploys/rollback-db.md` — despliegue con plan de rollback de base de datos
- `examples/deploys/rollback-automatizacion.md` — ejemplo de rollback para automatizaciones
- `examples/deploys/rollback-landing.md` — ejemplo de rollback para landing o web pública

### Checklists
- `checklists/saas-con-usuarios.md` — checklist para SaaS con usuarios
- `checklists/automatizacion-interna.md` — checklist para automatizaciones internas
- `checklists/landing-web.md` — checklist para landings y webs públicas
- `checklists/dashboard-admin.md` — checklist para dashboards admin

### Scripts
- `scripts/backup-example.sh` — ejemplo simple de script de backup

## Orden recomendado de lectura

1. `docs/10-donde-no-guardar-claves.md`
2. `docs/11-cuando-no-desplegar.md`
3. `docs/12-como-revertir.md`
4. `docs/13-como-pedir-cambios-pequenos-a-la-ia.md`
5. `docs/14-como-no-perder-la-base-de-datos.md`
6. `docs/01-principios.md`
7. `docs/02-seguridad-basica.md`
8. `docs/03-backups.md`
9. `docs/05-checklist-antes-de-desplegar.md`
10. `docs/06-trabajar-con-ia-sin-romperlo-todo.md`
11. `docs/07-claude-code.md`
12. `docs/08-codex.md`
13. `docs/09-claude-code-vs-codex.md`
14. revisa los ejemplos de `examples/stacks/` si tu proyecto encaja con uno de ellos
15. usa `checklists/` y `examples/deploys/` cuando vayas a desplegar

## Regla de oro

Si una app tiene usuarios, pagos, datos o acceso a APIs de terceros, nunca hagas cambios directos en producción sin:

- copia de seguridad reciente
- changelog mínimo
- variables en `.env`
- plan de rollback
- prueba funcional básica

## Quick start

1. clona o copia este repo
2. lee primero `docs/10-donde-no-guardar-claves.md`
3. sigue con `docs/11-cuando-no-desplegar.md` y `docs/12-como-revertir.md`
4. rellena `templates/PROJECT_BRIEF.md`
5. crea tu `.env` a partir de `examples/.env.example`
6. define un método de backup antes de tocar producción
7. usa `templates/PRE_DEPLOY_CHECKLIST.md` en cada deploy
8. si trabajas con agentes, lee también `docs/13-como-pedir-cambios-pequenos-a-la-ia.md`, `docs/07-claude-code.md`, `docs/08-codex.md` y `docs/09-claude-code-vs-codex.md`

## Qué NO intenta hacer este repo

No intenta enseñarte a programar desde cero.
No intenta ser un manual académico.
No intenta cubrir todos los stacks.
No intenta impresionarte con teoría que no te evita errores reales.

Su trabajo es más simple:

- ayudarte a no romper lo importante
- darte criterio mínimo operativo
- hacer que uses la IA con límites claros
- enseñarte a frenar antes de un error caro

## Recomendación fuerte

Si vas a crear repos para principiantes de vibe coding, este repo debería ser más de **criterio operativo** que de teoría.

Menos "qué es una API" y más:

- dónde NO guardar claves
- cuándo NO desplegar
- cómo revertir
- cómo pedir cambios pequeños a la IA
- cómo no perder la base de datos

## Siguientes mejoras sugeridas

- traducir también las docs clave al inglés
- añadir más ejemplos por stack y por tipo de app
- ampliar los playbooks de deploy y rollback
- añadir más checklists por tipo de proyecto
