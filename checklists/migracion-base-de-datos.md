# Checklist: migración de base de datos

## Antes
- [ ] sé qué base y entorno voy a tocar
- [ ] hay backup reciente y verificado
- [ ] sé qué tablas y columnas cambian
- [ ] la migración no mezcla cambios no relacionados
- [ ] conozco el impacto si falla a mitad

## Validación
- [ ] la app conecta después
- [ ] lectura y escritura funcionan
- [ ] los datos anteriores siguen presentes
- [ ] no faltan índices o restricciones esperadas
- [ ] logs sin errores críticos nuevos

## Rollback
- [ ] tengo plan para código
- [ ] tengo plan para datos
- [ ] sé si la migración es reversible
- [ ] sé cuánto tiempo puedo estar en estado mixto
