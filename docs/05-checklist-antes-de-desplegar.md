# Checklist antes de desplegar

Usa esto justo antes de publicar algo.
Si marcas muchas cosas con dudas, no despliegues todavía.

## Seguridad
- [ ] no hay secretos en código ni en commits
- [ ] `.env` está configurado correctamente
- [ ] no se ha abierto nada admin sin login
- [ ] no has expuesto claves en logs o capturas

## Datos
- [ ] hay backup reciente de la base de datos
- [ ] si hay uploads, también tienen copia
- [ ] si hay automatizaciones, existe export o versión anterior
- [ ] hay plan de rollback

## Cambio
- [ ] sabes qué archivos cambia este deploy
- [ ] el cambio está documentado en changelog o nota interna
- [ ] el alcance del cambio es entendible
- [ ] no estás mezclando arreglo y refactor grande

## Validación
- [ ] se ha probado el flujo principal
- [ ] se ha probado login si aplica
- [ ] se ha probado el caso exacto que se quería arreglar
- [ ] sabes qué vas a mirar justo después del deploy

## Infra
- [ ] variables de entorno correctas en servidor/panel
- [ ] dominio, puertos y rutas revisados si aplica
- [ ] logs accesibles tras deploy
- [ ] sabes cuál es la versión anterior buena

## Si la respuesta es “no sé”
Si no sabes responder cualquiera de estas preguntas:
- ¿qué cambia?
- ¿cómo se prueba?
- ¿cómo se revierte?
- ¿toca datos reales?

no despliegues todavía.

## Regla final
Si no puedes explicar en 30 segundos cómo volver atrás, no despliegues.