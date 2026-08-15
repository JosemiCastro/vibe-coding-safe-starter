# Rollback Plan

Completa esto **antes** del deploy. Si no puedes rellenarlo, el cambio aún no está listo.

## Contexto
- Proyecto:
- Entorno:
- Responsable:
- Fecha:
- Versión / commit que entra:
- Última versión buena:

## Qué puede romperse
- Flujo afectado:
- Usuarios afectados:
- Datos afectados:
- Integraciones afectadas:

## Señales para activar rollback
Marca criterios concretos:
- [ ] login falla
- [ ] flujo principal devuelve errores
- [ ] errores 5xx aumentan
- [ ] migración no termina
- [ ] automatización dispara acciones duplicadas
- [ ] otro:

## Cómo revertir código
- Comando o acción exacta:
- Versión a restaurar:
- Tiempo estimado:

## Cómo revertir datos
- Backup a utilizar:
- Migración reversible: sí / no
- Acción exacta:
- Riesgo de pérdida de datos:

## Cómo detener efectos activos
- Trigger, cron o workflow a pausar:
- Cola o proceso a detener:
- Acción externa que revisar:

## Validación después del rollback
- [ ] la app abre
- [ ] login funciona
- [ ] flujo principal funciona
- [ ] lectura y escritura de datos funcionan
- [ ] logs sin errores críticos nuevos
- [ ] automatizaciones controladas

## Decisión
- Quién autoriza rollback:
- Canal de comunicación:
- Nota final:
