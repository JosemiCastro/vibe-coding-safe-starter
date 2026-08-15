# Pre-Deploy Checklist

Usa esta plantilla justo antes de publicar algo real.
La idea no es marcar casillas por marcar: es obligarte a detectar huecos antes de romper producción.

## 1. Contexto
- Fecha:
- Responsable:
- Entorno:
- Proyecto:
- Versión / commit:

## 2. Cambio
- Qué se despliega:
- Por qué se hace:
- Archivos o sistemas afectados:
- Riesgo estimado: bajo / medio / alto
- Toca auth, pagos o DB: sí / no

## 3. Seguridad
- [ ] No hay secretos en código ni commits
- [ ] Variables revisadas en el entorno correcto
- [ ] No se ha expuesto nada admin sin login
- [ ] No se han compartido logs o capturas con datos sensibles

## 4. Datos y persistencia
- [ ] Hay backup reciente de la base de datos
- [ ] Si hay uploads, también tienen copia
- [ ] Si hay automatizaciones, existe export o versión anterior
- [ ] Si hay migración, está revisada
- [ ] Hay rollback definido para datos y para código

## 5. Validación previa
- [ ] Se ha probado el flujo principal
- [ ] Se ha probado login si aplica
- [ ] Se ha probado el caso exacto que se quería arreglar
- [ ] Se sabe qué revisar justo después del deploy

## 6. Infra y operación
- [ ] Variables de entorno correctas en servidor/panel
- [ ] Dominio, puertos y rutas revisados si aplica
- [ ] Logs accesibles tras deploy
- [ ] La última versión buena está identificada

## 7. Señales para BLOQUEAR el deploy
Marca si pasa algo de esto:
- [ ] No sé exactamente qué cambia
- [ ] No sé cómo volver atrás en menos de 5 minutos
- [ ] No tengo backup fiable si toca datos reales
- [ ] El cambio mezcla demasiadas cosas
- [ ] La IA tocó más archivos de los esperados

## 8. Decisión
- [ ] Aprobado para deploy
- [ ] Bloqueado hasta resolver puntos

## 9. Si está bloqueado, qué falta
- Punto 1:
- Punto 2:
- Punto 3:
