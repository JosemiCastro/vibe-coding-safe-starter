# Project Brief

Rellena esto antes de pedir cambios grandes a una IA o antes del primer deploy serio.
Si no puedes completar varias secciones, todavía te falta contexto para tocar producción con seguridad.

Si no conoces un dato, escribe **“No lo sé todavía”**. Esa respuesta identifica una comprobación pendiente; no la inventes.

## 1. Identidad del proyecto
- Nombre del proyecto:
- Responsable actual:
- Fecha:
- Estado: idea / MVP / interno / producción

## 2. Qué problema resuelve
- Qué hace en una frase:
- Qué problema evita o mejora:
- Qué pasaría si mañana dejara de funcionar:

## 3. Quién lo usa
- Tipo de usuario:
- Número aproximado de usuarios:
- Hay usuarios de pago: sí / no
- Hay equipo interno que depende de esto: sí / no

## 4. Stack y arquitectura mínima
- Frontend:
- Backend:
- Base de datos:
- Automatizaciones / cron / n8n:
- Hosting / panel / VPS:
- Repositorio:

## 5. Entornos
- Local:
- Staging:
- Producción:
- Cómo sabes en qué entorno estás:

## 6. Integraciones externas
Para cada integración, indica:
- servicio:
- para qué se usa:
- qué secreto necesita:
- dónde vive ese secreto:
- qué pasa si falla:

## 7. Datos sensibles que toca
Marca todo lo que aplique:
- [ ] emails
- [ ] teléfonos
- [ ] datos de clientes
- [ ] contraseñas o auth
- [ ] pagos
- [ ] documentos o archivos privados
- [ ] datos internos del negocio

## 8. Flujos críticos
Lista lo que no se puede romper:
- login
- alta/registro
- pago
- envío de formulario
- automatización crítica
- panel admin
- otro:

## 9. Riesgos principales
- Qué parte te preocupa más hoy:
- Qué error sería más caro:
- Qué cambio NO debería hacerse sin revisión extra:

## 10. Cómo se despliega hoy
- Quién despliega:
- Desde dónde se despliega:
- Pasos resumidos:
- Qué se valida después:

## 11. Cómo se hace rollback hoy
- Última versión buena conocida:
- Cómo vuelves atrás en código:
- Cómo vuelves atrás en DB si aplica:
- Cuánto tardas en revertir:
- Qué compruebas después:

## 12. Backups
- Qué se copia:
- Con qué frecuencia:
- Dónde se guarda:
- Última restauración probada:

## 13. Notas para trabajar con IA
- Qué zonas NO debe tocar sin permiso:
- Qué archivos suelen romper más cosas:
- Qué formato de respuesta quieres de la IA:
  - archivos afectados
  - riesgos
  - validación
  - rollback
