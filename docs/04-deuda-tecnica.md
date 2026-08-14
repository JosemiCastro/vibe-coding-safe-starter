# Deuda técnica para principiantes

## La deuda técnica no es pecado
El problema no es tener deuda.
El problema es no saber que la tienes.

## Deuda aceptable
Puede ser razonable si:

- acelera un MVP
- está documentada
- no afecta seguridad
- no pone en riesgo datos
- tiene plan de revisión

## Deuda inaceptable
No deberías aceptar deuda en:

- auth rota o improvisada
- secretos expuestos
- backups inexistentes
- SQL destructivo sin copia
- lógica crítica sin ninguna prueba
- deploys manuales opacos que nadie entiende

## Señales de alarma
- la IA toca 12 archivos para un cambio pequeño
- nadie sabe qué hace una función crítica
- hay variables duplicadas y nombres ambiguos
- el proyecto depende de copiar/pegar sin criterio
- cada deploy da miedo

## Regla útil
Si un cambio futuro va a costar el doble por un atajo de hoy, apúntalo ya.

## Qué documentar siempre
- deuda detectada
- impacto
- riesgo
- cuándo revisarla

## Política sencilla
- prototipos: deuda moderada permitida
- apps con usuarios: deuda limitada
- apps con pagos o datos sensibles: deuda muy controlada
