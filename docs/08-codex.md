# Guía rápida de Codex para gente que empieza

Codex puede ser muy potente para construir cosas rápido, pero también puede darte demasiada confianza si no sabes todavía evaluar bien lo que toca.

La clave no es usar menos Codex.
La clave es usarlo con límites claros.

## Para qué usar Codex al principio

Sí:
- construir pequeñas funcionalidades
- arreglar bugs concretos
- pedir explicaciones de código
- crear tests
- revisar diffs
- refactor pequeño y localizado

No de entrada:
- rehacer toda la app
- tocar producción sin backup
- cambiar auth, pagos o base de datos sin validación humana

## Cómo pedirle trabajo útil

Un buen prompt para Codex debería incluir:

- qué quieres conseguir
- stack
- archivos o módulos relevantes
- lo que NO debe tocar
- cómo se prueba
- cómo se revierte

### Ejemplo bueno

```text
Proyecto Node + Express.
Quiero añadir validación al endpoint de crear reseña.
Toca solo el controlador y la validación relacionada.
No cambies auth ni base de datos.
Explícame riesgos, pruebas y rollback.
```

### Ejemplo malo

```text
Mejora el backend.
```

## Riesgos típicos usando Codex sin criterio

### 1. Cambios demasiado grandes
Si el prompt es difuso, Codex tenderá a abrir demasiado el alcance.

### 2. Refactors innecesarios
A veces arregla una cosa y reestructura tres.
Eso para un principiante es peligroso porque luego no sabes qué revisar.

### 3. Falsa sensación de seguridad
Que el código "parezca bueno" no significa que:
- sea seguro
- no rompa algo
- esté bien probado
- sea mantenible

### 4. Tocar demasiado rápido la base de datos
Cualquier cambio de esquema, borrado o migración debería ir con backup previo.

## Flujo recomendado con Codex

1. haz commit o backup antes
2. define un cambio muy concreto
3. pasa contexto suficiente
4. revisa qué archivos cambia
5. ejecuta prueba funcional mínima
6. documenta el cambio
7. despliega solo con rollback claro

## Qué pedirle siempre en la respuesta

- resumen del cambio
- archivos afectados
- riesgos
- pasos de prueba
- pasos de rollback

## Qué revisar tú aunque no programes mucho

- si tocó demasiados archivos
- si añadió dependencias que no necesitabas
- si cambió nombres o estructura sin motivo
- si mezcló arreglos con refactor
- si tocó secretos, `.env`, auth o DB sin avisar

## Cuándo sí merece mucho la pena

- arreglos rápidos y bien acotados
- generar tests base
- analizar errores con logs
- hacer revisiones de cambios
- comparar dos enfoques pequeños

## Cuándo deberías frenar

- cuando el cambio afecta dinero, usuarios o permisos
- cuando el prompt te sale demasiado abstracto
- cuando no tienes backup
- cuando no sabrías volver al estado anterior

## Prompt mínimo recomendado

Usa una base como `examples/SAFE_PROMPT_TEMPLATE.md` y añade:

- qué archivos puede tocar
- qué no debe tocar
- que no haga refactor salvo necesidad real
- que explique validación y rollback

## Regla final

Codex puede hacer mucho trabajo por ti.
Pero si no separas bien:
- construir
- revisar
- probar
- desplegar

acabarás confundiendo velocidad con control.
Y en cuanto haya usuarios o datos reales, eso sale caro.
