# Principios para empezar con vibe coding sin liarla

## 1. No toques producción a ciegas
Si no entiendes qué cambia, no lo despliegues directo.
Pide siempre a la IA que te diga:

- qué archivos toca
- qué riesgo tiene
- cómo revertirlo
- cómo probarlo

## 2. Cambios pequeños o caos
No pidas:
- "refactoriza toda la app"
- "mejora todo el backend"

Pide:
- "cambia este formulario"
- "añade validación a este endpoint"
- "arregla este error concreto"

## 3. Un proyecto sin brief acaba siendo un accidente
Antes de construir, documenta:

- qué hace la app
- quién la usa
- qué datos guarda
- qué integraciones tiene
- qué partes son críticas

## 4. Nada de secretos en código
Nunca metas tokens, claves o passwords en:

- JS/TS/Python/PHP
- repositorios
- capturas
- documentación pública

Todo va en `.env`.

## 5. Si no puedes restaurarlo, no tienes backup
Guardar un archivo no es tener backup.
Tener backup es:

- poder restaurar
- saber dónde está
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

## 8. Cada cambio debería dejar rastro
Como mínimo:

- qué cambió
- cuándo
- por qué
- cómo volver atrás

## 9. Si algo falla, congela antes de improvisar
Cuando rompas algo:

1. para
2. guarda logs
3. no hagas 20 cambios a la vez
4. vuelve al último estado bueno si hace falta

## 10. Menos magia, más sistema
El objetivo no es parecer técnico.
El objetivo es construir cosas que puedas mantener dentro de 3 meses.
