# Plantilla segura para pedir cambios a una IA

Copia, rellena y envía primero la **fase 1**. No autorices cambios hasta entender el plan.

## Fase 1 — inspeccionar sin modificar

```text
Analiza este proyecto sin modificar archivos ni ejecutar deploys.

Contexto:
- stack: [React / Node / Python / n8n / otro]
- entorno: [local / staging / producción]
- problema concreto: [una frase]
- comportamiento actual: [qué ocurre]
- resultado esperado: [qué debería ocurrir]

Alcance permitido:
- archivos o zona: [lista]

No tocar sin autorización:
- autenticación
- pagos
- base de datos y migraciones
- variables de entorno
- infraestructura o deploy
- archivos fuera del alcance

Devuélveme antes de cambiar nada:
1. causa probable
2. archivos que propones tocar
3. cambio mínimo
4. riesgos
5. cómo probarlo
6. cómo revertirlo
7. dudas o supuestos
```

## Fase 2 — autorizar un cambio pequeño

Solo después de revisar la fase 1:

```text
Autorizo únicamente el cambio mínimo descrito en [archivo/zona].

Restricciones:
- no amplíes el alcance
- no refactorices código no relacionado
- no instales dependencias sin pedir permiso
- no ejecutes deploy, migraciones ni comandos destructivos
- no introduzcas secretos

Al terminar, devuelve:
1. resumen
2. archivos modificados
3. pruebas ejecutadas y resultado real
4. riesgos pendientes
5. rollback exacto
```

## Señales para detener la tarea

Detén y pregunta si:
- necesitas tocar más archivos
- aparece auth, pagos o datos reales
- falta contexto o acceso
- una prueba requiere producción
- el rollback no está claro
