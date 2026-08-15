# Cuándo NO desplegar

La mayoría de problemas de principiantes no vienen por programar mal.
Vienen por desplegar demasiado pronto.

## No despliegues si
- no entiendes qué cambia
- no sabes qué archivos ha tocado la IA
- no tienes backup si hay datos reales
- no sabes volver al estado anterior
- no has probado el flujo principal
- el cambio mezcla muchas cosas a la vez
- has tocado auth, pagos o base de datos sin revisar impacto

## Señales de peligro

### 1. El prompt fue demasiado amplio
Si pediste algo como:
- "mejora la app"
- "refactoriza el sistema"
- "deja esto más profesional"

no despliegues sin revisar mucho más.

### 2. Hay demasiados archivos cambiados
Si querías tocar un formulario y aparecen 15 archivos, mala señal.

### 3. No sabes explicar el rollback
Si no sabes responder "cómo vuelvo atrás en 5 minutos", no despliegues.

### 4. No has visto logs ni error real
Si la corrección se hizo a ojo, no despliegues.

### 5. El deploy es tu forma de descubrir si funciona
Eso no es validación. Eso es apostar.

## Regla de seguridad
Si el cambio afecta:
- login
- usuarios
- permisos
- pagos
- base de datos
- automatizaciones

sube el nivel de prudencia.

## Qué hacer en vez de desplegar
- pedir a la IA resumen de archivos afectados
- pedir riesgos
- pedir rollback
- probar el flujo concreto
- hacer commit del estado bueno
- separar el cambio en partes más pequeñas
- pedir que quite refactors no relacionados

## Microchecklist
Antes de desplegar deberías poder decir:
- qué cambia
- cómo se prueba
- cómo se revierte
- si toca datos reales
- qué mirarás tras publicar

## Regla final
Tu problema casi nunca será "desplegué tarde".
Tu problema será "desplegué algo que no entendía".