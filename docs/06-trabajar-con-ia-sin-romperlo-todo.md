# Cómo trabajar con IA sin romperlo todo

La IA te puede ahorrar muchísimo trabajo.
También te puede multiplicar el riesgo si la usas sin límites.

## Flujo recomendado

### 1. Explica contexto antes de pedir código
Dale a la IA:
- stack
- objetivo
- archivo o zona concreta
- restricción importante
- criterio de éxito
- cómo validar

### 2. Pide cambios pequeños
Mejor:
- "añade validación a este formulario"
- "corrige este 400 en este endpoint"
- "toca solo este componente"

Peor:
- "rehaz toda la app"
- "mejora el sistema"
- "déjalo listo para producción"

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
- si toca auth, DB o deploy sin pedirlo

### 5. Guarda estado antes de tocar
Antes de aplicar un cambio importante:
- commit
- backup
- nota del estado actual
- versión buena identificada

### 6. Si algo falla, no lo tapes con más prompts
No hagas esto:
- pegar el error y pedir "arregla todo"
- lanzar 6 soluciones distintas encima
- aceptar otra tanda de cambios sin entender la primera

Haz esto:
- identifica el error
- comparte logs
- pide una corrección específica
- reduce el alcance

## Prompt recomendado
Usa `examples/SAFE_PROMPT_TEMPLATE.md` como base.

## Respuesta que deberías exigir a la IA
Pídele siempre que te devuelva:
- archivos afectados
- resumen corto del cambio
- riesgos
- validación
- rollback

## Señales de que vas mal
- el agente cambia media app para arreglar una cosa
- tú ya no sabes qué hace cada cambio
- has dejado de revisar los archivos afectados
- el deploy parece la única forma de “probar”

## Regla final
La IA funciona mejor cuando el cambio está bien acotado.
Si el prompt es vago, el riesgo también se vuelve vago.