# Checklist: pagos y suscripciones

## Antes de tocar nada
- [ ] sé si estoy en sandbox o producción
- [ ] no hay claves secretas en frontend
- [ ] los webhooks validan firma
- [ ] tengo identificado el evento exacto que cambia
- [ ] sé qué usuarios o facturas podrían verse afectados

## Antes de desplegar
- [ ] pruebo pago correcto
- [ ] pruebo pago rechazado
- [ ] pruebo webhook duplicado
- [ ] pruebo cancelación o devolución si aplica
- [ ] confirmo que una repetición no cobra dos veces
- [ ] tengo rollback de código sin borrar registros de pago

## Bloquea el deploy si
- [ ] no distingues sandbox de producción
- [ ] no sabes qué hace un webhook repetido
- [ ] no puedes reconciliar pagos después
