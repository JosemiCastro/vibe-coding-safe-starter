# Seguridad básica para gente que empieza

## Secretos
Nunca subas al repo:

- API keys
- contraseñas
- tokens JWT reales
- credenciales de base de datos
- ficheros `.env`

Usa siempre:

- `.env`
- `.env.example`
- secretos del proveedor de deploy si aplica

## Auth y permisos
Si una app tiene usuarios:

- no expongas paneles admin sin login
- no confíes solo en el frontend
- valida permisos en backend
- limita quién puede ver o editar datos

## Base de datos
Antes de tocar esquema o borrar datos:

- haz backup
- apunta qué tablas cambian
- prepara rollback

## Ficheros y uploads
Nunca des por seguro un archivo subido por el usuario.

Mínimo:

- limita tamaño
- valida tipo
- evita ejecución arbitraria
- no guardes nada sensible en rutas públicas

## Logs
Los logs no deben incluir:

- passwords
- tokens
- números sensibles
- datos personales innecesarios

## Integraciones externas
Cada integración debe tener claro:

- qué token usa
- dónde vive ese token
- qué permisos tiene
- qué pasa si caduca

## Reglas rápidas
- mínimo privilegio
- secretos fuera del código
- backend valida, frontend ayuda
- si dudas, no expongas
