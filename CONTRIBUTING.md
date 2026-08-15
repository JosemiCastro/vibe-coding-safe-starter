# Contributing

Gracias por mejorar este recurso. La prioridad es ayudar a principiantes a evitar errores reales.

## Qué aporta valor

- checklists verificables
- casos reales de deploy, rollback o incidentes
- scripts seguros y no destructivos
- prompts pequeños y claros
- explicaciones que indiquen cuándo frenar

## Qué evitamos

- teoría básica sin aplicación práctica
- ejemplos con secretos reales
- scripts destructivos sin protecciones
- consejos vagos como “usa buenas prácticas”
- cambios enormes que mezclan varios temas

## Antes de abrir una PR

1. crea una rama
2. haz un cambio pequeño
3. ejecuta:

```bash
./scripts/validate-repo.sh
```

4. si tocaste scripts, pruébalos en un directorio temporal
5. confirma que no incluyes claves, tokens ni datos privados
6. explica riesgo y rollback en la PR

## Estilo

- español claro y directo
- frases cortas
- primero la acción, después la explicación
- cada recomendación debe incluir un ejemplo, señal de alarma o checklist

## Seguridad

No abras una issue pública con vulnerabilidades sensibles o secretos. Sigue [SECURITY.md](./SECURITY.md).
