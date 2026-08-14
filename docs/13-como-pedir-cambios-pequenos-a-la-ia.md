# Cómo pedir cambios pequeños a la IA

Si estás empezando, esta habilidad vale más que saber explicar teoría técnica.

## El error típico

Pedir cosas demasiado grandes:
- "mejora toda la app"
- "hazla más profesional"
- "arregla el backend"

Eso suele producir:
- demasiados archivos tocados
- mezcla de arreglo y refactor
- cambios difíciles de revisar
- más riesgo al desplegar

## Qué pedir en su lugar

Pide unidades pequeñas y revisables.

Ejemplos buenos:
- "añade validación a este formulario"
- "corrige este error 400 en este endpoint"
- "toca solo este componente y su endpoint"
- "no cambies auth ni base de datos"

## Estructura de prompt recomendada

Incluye siempre:
- objetivo concreto
- stack
- archivos o zona afectada
- lo que NO puede tocar
- cómo validar
- cómo revertir

## Plantilla mínima

```text
Proyecto [stack].
Quiero cambiar [zona concreta].
Toca solo [archivo/modulo/flujo].
No cambies [auth/base de datos/deploy/otras áreas].
Dime archivos afectados, riesgos, validación y rollback.
```

## Regla práctica

Si el cambio no lo puedes describir en 3-5 líneas claras, probablemente todavía es demasiado grande.

## Si la IA devuelve demasiado

No pegues eso sin más.
Responde:
- "reduce el alcance"
- "separa esto en pasos"
- "haz solo la parte A"
- "no refactorices nada no relacionado"

## Regla final

Cambios pequeños no te hacen ir más lento.
Te evitan romper más cosas de las que puedes revisar.
