# Cómo trabajar con IA sin romperlo todo

## Flujo recomendado

### 1. Explica contexto antes de pedir código
Dale a la IA:

- stack
- objetivo
- archivo o zona concreta
- restricción importante
- criterio de éxito

### 2. Pide cambios pequeños
Mejor:
- "añade validación a este formulario"

Peor:
- "rehaz toda la app"

### 3. Pide siempre impacto y rollback
Una buena petición incluye:

- qué cambia
- riesgos
- cómo probarlo
- cómo deshacerlo

### 4. Revisa antes de pegar
Aunque no programes, revisa:

- si mete claves
- si borra cosas que no toca
- si cambia demasiados archivos
- si introduce complejidad absurda

### 5. Guarda estado antes de tocar
Antes de aplicar un cambio importante:

- commit
- backup
- nota del estado actual

### 6. Si algo falla, no lo tapes con más prompts
No hagas esto:
- pegar el error y pedir "arregla todo"
- lanzar 6 soluciones distintas encima

Haz esto:
- identifica el error
- comparte logs
- pide una corrección específica

## Prompt recomendado
Usa `examples/SAFE_PROMPT_TEMPLATE.md` como base.
