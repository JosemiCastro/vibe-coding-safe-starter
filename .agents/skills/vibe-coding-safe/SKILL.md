---
name: vibe-coding-safe
description: Use when a beginner builds or changes software with AI. Apply small changes, protect secrets and data, prepare rollback, and verify before deployment.
---

# Vibe Coding Safe

## Objetivo

Ayuda a una persona principiante a construir o modificar software con IA sin convertir una petición sencilla en un cambio grande, irreversible o difícil de comprobar.

Responde en el idioma del usuario. Explica decisiones con palabras sencillas, pero ejecuta comprobaciones reales cuando las herramientas estén disponibles.

## Cuándo usar esta skill

Úsala cuando el usuario pida:

- crear o modificar una aplicación con IA;
- añadir login, pagos, roles, APIs o automatizaciones;
- cambiar una base de datos o ejecutar una migración;
- preparar o realizar un despliegue;
- guardar claves, tokens o variables de entorno;
- crear, comprobar o restaurar un backup;
- arreglar producción o preparar un rollback.

No la uses para preguntas puramente teóricas sin cambios sobre un proyecto.

## Principio principal

Avanza mediante el cambio seguro más pequeño que produzca valor y pueda verificarse y revertirse.

No presentes una automatización como garantía absoluta. Un script correcto reduce riesgos, pero no demuestra por sí solo que producción sea segura.

## Flujo obligatorio

### 1. Inspecciona antes de modificar

Comprueba, según corresponda:

- estado de Git y archivos modificados;
- estructura y stack del proyecto;
- instrucciones existentes del repositorio;
- entorno afectado: local, pruebas o producción;
- datos persistentes, integraciones y usuarios afectados;
- pruebas y scripts disponibles.

No inventes respuestas. Si un dato necesario no puede comprobarse, escribe `no comprobado` y explica qué falta.

**Terminado cuando:** conoces el alcance, el entorno y los riesgos principales.

### 2. Reduce el cambio

Define una sola mejora observable. Evita mezclar refactor, dependencias, migraciones y cambios visuales salvo que sean inseparables.

Antes de editar, indica brevemente:

- qué vas a cambiar;
- qué no vas a tocar;
- cómo se comprobará;
- cómo se revertirá.

**Terminado cuando:** el cambio puede revisarse y revertirse de forma independiente.

### 3. Protege secretos

Nunca escribas claves, tokens, passwords ni cadenas de conexión en código, documentación, prompts, logs o commits.

- Usa variables de entorno o el gestor de secretos del proveedor.
- Mantén `.env` fuera de Git.
- Usa valores claramente ficticios en ejemplos.
- Si detectas un secreto real, no lo reproduzcas: redáctalo y recomienda rotarlo.

**Bloqueo:** no continúes al despliegue si hay secretos versionados o expuestos.

### 4. Protege los datos

Si el cambio toca datos persistentes, autenticación, pagos, uploads o migraciones:

1. crea un backup antes del cambio;
2. verifica checksums y legibilidad;
3. conserva una copia fuera del servidor principal;
4. separa rollback de código y restauración de datos;
5. prueba la restauración en un entorno aislado cuando el riesgo lo justifique.

Si existen en el repositorio, usa:

```bash
APP_ROOT=/ruta/proyecto BACKUP_ROOT=/ruta/externa ./scripts/backup-example.sh
./scripts/verify-backup-example.sh /ruta/al/backup
```

**Bloqueo:** la mera existencia de una carpeta llamada `backup-*` no cuenta como backup válido.

### 5. Prepara rollback

Antes de desplegar, identifica:

- versión o commit estable al que volver;
- señal concreta que activa el rollback;
- comandos o pasos de reversión;
- tratamiento de migraciones y datos;
- comprobación posterior.

Usa `templates/ROLLBACK_PLAN.md` si está disponible.

**Terminado cuando:** otra persona podría ejecutar la reversión sin improvisar.

### 6. Implementa y prueba

Realiza únicamente el cambio acordado. Ejecuta las pruebas relevantes y registra resultados reales, no resultados esperados.

Si existen en el repositorio, ejecuta:

```bash
./scripts/validate-repo.sh
./scripts/test-scripts.sh
```

No instales dependencias, no borres datos y no cambies producción sin autorización explícita.

**Terminado cuando:** las pruebas pasan o el bloqueo está documentado con su salida real.

### 7. Decide si desplegar

Ejecuta el chequeo de predeploy cuando exista:

```bash
APP_ROOT=/ruta/proyecto ./scripts/predeploy-check-example.sh
```

No despliegues si ocurre cualquiera de estos casos:

- no hay rollback claro;
- el cambio de datos no tiene backup verificado;
- hay secretos expuestos;
- las pruebas relevantes fallan;
- no está claro qué entorno se modificará;
- el usuario no ha autorizado una acción con efectos externos.

Un código de salida `0` es una comprobación adicional, no una garantía de seguridad.

### 8. Verifica después

Tras el cambio o despliegue, comprueba el comportamiento desde la perspectiva del usuario y revisa errores, logs y datos afectados.

Informa con este formato:

- **Cambio:** qué se modificó.
- **Pruebas:** comandos y resultados reales.
- **Datos:** backup y verificación, o `no aplica`.
- **Rollback:** referencia o pasos preparados.
- **Estado:** completado o bloqueado.

## Escala de riesgo

| Riesgo | Ejemplos | Acción mínima |
|---|---|---|
| Bajo | texto, estilos, documentación | prueba visual o validación de enlaces |
| Medio | lógica, API externa, automatización | pruebas, límites, logs y rollback |
| Alto | login, pagos, roles, migraciones, borrado | backup verificado, entorno de prueba, rollback y autorización explícita |

## Errores que debes evitar

- aceptar una petición amplia como “mejora toda la app” sin dividirla;
- modificar archivos antes de entender el proyecto;
- copiar `.env` dentro de un backup general;
- afirmar que un backup sirve sin verificarlo;
- revertir código creyendo que también revierte los datos;
- mostrar el valor de un posible secreto en la salida;
- desplegar solo porque las pruebas automáticas pasan;
- ocultar un fallo detrás de una explicación optimista.

## Criterio de finalización

No declares el trabajo terminado hasta que:

- el alcance acordado esté implementado;
- no se hayan introducido secretos;
- las pruebas relevantes tengan resultados reales;
- los datos estén protegidos cuando aplique;
- exista una vía de rollback;
- el estado final esté verificado.
