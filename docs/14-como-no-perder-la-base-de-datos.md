# Cómo no perder la base de datos

Si tienes que obsesionarte con una sola cosa al empezar, que sea esta.

## Cómo se pierde una base de datos en proyectos pequeños
- desplegando migraciones sin backup
- borrando datos "de prueba" que no eran de prueba
- cambiando variables de conexión sin revisar entorno
- reseteando volúmenes o contenedores sin entender impacto
- ejecutando scripts destructivos generados por IA
- apuntando por error a producción desde local o staging

## Reglas mínimas

### 1. Antes de tocar DB, backup
No después. Antes.

### 2. Nunca ejecutes scripts destructivos a ciegas
Si ves `DROP`, `TRUNCATE`, `DELETE` masivo o reseteos, frena.

### 3. No mezcles deploy y migración sin pensar rollback
Código y datos no se recuperan igual.

### 4. Identifica qué entorno estás tocando
No es lo mismo local, staging o producción.

## Qué deberías comprobar antes
- nombre de la base
- host
- usuario
- si estás en producción o no
- si hay backup reciente y restaurable
- si la migración tiene vuelta atrás
- si el script toca datos o solo estructura

## Qué pedir a la IA
Antes de ejecutar nada relacionado con DB, pide:
- qué tablas toca
- si el cambio es destructivo o no
- si requiere migración
- cómo revertirlo
- qué validar después
- qué riesgo tiene si algo falla a mitad

## Validación mínima después
- la app conecta
- el flujo principal funciona
- no faltan tablas o columnas esperadas
- no has vaciado datos por error
- las variables de conexión siguen apuntando al entorno correcto

## Señales de alarma
- no sabes si estás en staging o producción
- el backup existe pero nadie lo ha restaurado nunca
- vas a ejecutar un script que no entiendes del todo
- el cambio de DB entra mezclado con otras 10 cosas

## Regla final
Puedes reconstruir bastante código.
Tus datos reales no siempre.
Trata la base de datos como lo más sensible del proyecto.