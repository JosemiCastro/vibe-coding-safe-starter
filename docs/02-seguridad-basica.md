# Seguridad básica para gente que empieza

No necesitas ser experto en seguridad para evitar los fallos más típicos.
Necesitas no hacer cosas peligrosas por desconocimiento.

## 1. Secretos
Nunca subas al repo:
- API keys
- contraseñas
- tokens JWT reales
- credenciales de base de datos
- ficheros `.env`
- exports con credenciales embebidas

Usa siempre:
- `.env`
- `.env.example`
- secretos del proveedor de deploy si aplica
- variables separadas por entorno

## 2. Auth y permisos
Si una app tiene usuarios:
- no expongas paneles admin sin login
- no confíes solo en el frontend
- valida permisos en backend
- limita quién puede ver o editar datos
- prueba usuarios sin permisos antes de publicar

## 3. Base de datos
Antes de tocar esquema o borrar datos:
- haz backup
- apunta qué tablas cambian
- prepara rollback
- confirma que estás en el entorno correcto

## 4. Ficheros y uploads
Nunca des por seguro un archivo subido por el usuario.

Mínimo:
- limita tamaño
- valida tipo
- evita ejecución arbitraria
- no guardes nada sensible en rutas públicas
- no expongas enlaces directos si no toca

## 5. Logs
Los logs no deben incluir:
- passwords
- tokens
- números sensibles
- datos personales innecesarios
- dumps enteros de peticiones con secretos

## 6. Integraciones externas
Cada integración debe tener claro:
- qué token usa
- dónde vive ese token
- qué permisos tiene
- qué pasa si caduca
- cómo se rota

## 7. Errores típicos de principiante
- pegar una key en el frontend para salir del paso
- dejar un panel admin accesible por URL
- compartir capturas con secretos visibles
- usar la misma clave en local y producción

## Microchecklist antes de publicar
- [ ] no hay secretos en código ni commits
- [ ] admin requiere login
- [ ] backend valida permisos
- [ ] logs no enseñan datos sensibles
- [ ] integraciones tienen tokens controlados

## Regla final
La seguridad básica no va de paranoia.
Va de no cometer errores obvios que luego cuestan dinero, tiempo y confianza.