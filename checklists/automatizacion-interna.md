# Checklist: automatización interna

## Alcance
- [ ] sé qué trigger inicia el flujo
- [ ] sé qué sistemas puede modificar
- [ ] he identificado acciones destructivas
- [ ] sé qué pasa si se ejecuta dos veces

## Antes del cambio
- [ ] workflow o script exportado
- [ ] credenciales revisadas
- [ ] prueba con datos controlados
- [ ] trigger automático desactivado durante la prueba

## Validación
- [ ] ejecución correcta
- [ ] error controlado
- [ ] reintento sin duplicar acciones
- [ ] logs e historial accesibles

## Rollback
- [ ] versión anterior disponible
- [ ] sé cómo pausar el trigger
- [ ] sé cómo corregir efectos ya ejecutados
- [ ] hay responsable si falla fuera de horario
