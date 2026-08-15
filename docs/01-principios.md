# Principios para empezar con vibe coding sin liarla

Este repo no está pensado para enseñarte teoría.
Está pensado para ayudarte a no cometer errores caros mientras construyes con IA.

## 1. No toques producción a ciegas
Si no entiendes qué cambia, no lo despliegues.

Antes de aceptar un cambio, pide siempre:
- qué archivos toca
- qué riesgo tiene
- cómo probarlo
- cómo revertirlo

## 2. Cambios pequeños o caos
No pidas:
- "refactoriza toda la app"
- "mejora todo el backend"
- "déjalo más profesional"

Pide:
- "cambia este formulario"
- "añade validación a este endpoint"
- "corrige este error concreto"

## 3. Un proyecto sin brief acaba siendo un accidente
Antes de construir, documenta:
- qué hace la app
- quién la usa
- qué datos guarda
- qué integraciones tiene
- qué partes son críticas
- qué rompería el negocio si falla

Usa `templates/PROJECT_BRIEF.md`.

## 4. Nada de secretos en código
Nunca metas tokens, claves o passwords en:
- código fuente
- repositorios
- capturas
- documentación pública
- exports compartidos

Todo va en `.env` o en el gestor de secretos de la plataforma.

## 5. Si no puedes restaurarlo, no tienes backup
Guardar un archivo no es tener backup.
Tener backup es:
- poder restaurar
- saber dónde está
- saber de cuándo es
- comprobar que sirve

## 6. La IA acelera, pero no decide sola
La IA propone.
Tú validas.
Especialmente en:
- auth
- pagos
- base de datos
- borrados
- permisos
- despliegues

## 7. La deuda técnica no se elimina, se gestiona
Acepta deuda solo si:
- sabes cuál es
- la documentas
- no compromete seguridad o datos
- no rompe rollback ni mantenimiento básico

## 8. Cada cambio debería dejar rastro
Como mínimo:
- qué cambió
- cuándo
- por qué
- quién lo pidió
- cómo volver atrás

## 9. Si algo falla, congela antes de improvisar
Cuando rompas algo:
1. para
2. guarda logs
3. no hagas 20 cambios a la vez
4. vuelve al último estado bueno si hace falta
5. documenta qué pasó

## 10. Menos magia, más sistema
El objetivo no es parecer técnico.
El objetivo es construir cosas que puedas mantener dentro de 3 meses.

## Checklist mental rápida
Antes de seguir, deberías poder responder sí a esto:
- ¿sé qué va a cambiar?
- ¿sé cómo probarlo?
- ¿sé cómo volver atrás?
- ¿sé si toca datos reales?
- ¿sé dónde están los secretos?

Si no, aún no estás listo para desplegar.