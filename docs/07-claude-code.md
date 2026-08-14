# Guía rápida de Claude Code para gente que empieza

Claude Code puede acelerar muchísimo, pero si no sabes programar bien todavía también te puede meter cambios demasiado grandes, tocar demasiados archivos o dejarte una falsa sensación de seguridad.

Esta guía es para usarlo con cabeza.

## Qué es buena idea pedirle

Sí:
- arreglos concretos
- formularios
- validaciones
- pequeños endpoints
- tests
- revisión de errores con logs
- mejoras acotadas en un archivo o módulo

No de entrada:
- "refactoriza todo"
- "reconstruye la arquitectura"
- "mejora toda la seguridad"
- "haz el deploy completo"

## Cómo pedirle cambios bien

Usa prompts con este formato:

- objetivo exacto
- stack
- archivo o zona afectada
- restricciones
- validación esperada
- rollback

### Ejemplo bueno

```text
Proyecto React + Node + Postgres.
Quiero arreglar el formulario de login.
Toca solo el frontend del login y el endpoint correspondiente.
No cambies auth global ni sesiones.
Explícame archivos afectados, riesgos, cómo probarlo y cómo revertirlo.
```

### Ejemplo malo

```text
Arregla el login y mejora el sistema.
```

## Reglas para usar Claude Code sin liarla

### 1. Dale contexto antes de pedir código
Si no sabe:
- stack
- archivos
- límites
- criterio de éxito

te devolverá cambios demasiado amplios.

### 2. Limita el alcance
Pide siempre algo como:
- "toca solo estos archivos si es posible"
- "no cambies la base de datos"
- "no toques auth salvo que sea imprescindible"

### 3. Oblígale a explicarte impacto
Pídele siempre:
- qué cambia
- qué riesgo tiene
- cómo probarlo
- cómo volver atrás

### 4. Nunca le des permiso ciego en producción
Claude Code puede escribir y ejecutar cosas. Eso no significa que deba hacerlo directamente sobre tu servidor vivo.

### 5. Si hay error, pasa logs reales
No digas solo "no funciona".
Pega:
- error exacto
- logs
- qué estabas haciendo
- qué esperabas que pasara

## Flujo recomendado

1. haz commit o backup
2. define cambio pequeño
3. prepara prompt claro
4. revisa archivos afectados
5. prueba flujo principal
6. documenta el cambio
7. despliega solo si sabes revertir

## Qué revisar antes de aceptar su trabajo

- ¿ha tocado más archivos de la cuenta?
- ¿ha metido secretos?
- ¿ha roto naming o estructura?
- ¿ha añadido complejidad absurda?
- ¿ha cambiado algo sensible sin pedirlo?

## Casos donde Claude Code aporta mucho

- revisar diffs
- encontrar bugs con contexto
- añadir tests
- rehacer código repetido en una zona concreta
- explicar código heredado

## Casos donde debes vigilar mucho más

- auth
- pagos
- borrados
- migraciones de base de datos
- permisos
- despliegues
- cron jobs o automatizaciones que pueden ejecutarse solas

## Prompt mínimo recomendado

Puedes partir de `examples/SAFE_PROMPT_TEMPLATE.md`.

Si usas Claude Code mucho, crea una versión propia con tus reglas:
- no tocar producción
- no subir secretos
- cambios pequeños
- explicar rollback

## Regla final

Claude Code es muy bueno proponiendo y ejecutando cambios.
Pero si tú no controlas el alcance, el riesgo y la validación, el problema no será Claude Code.
Será el proceso.
