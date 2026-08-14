# Dónde NO guardar claves

Si estás empezando con vibe coding, este punto te puede ahorrar uno de los errores más caros y más tontos.

## Nunca guardes claves en

- archivos `.js`, `.ts`, `.py`, `.php`
- frontend (`React`, `Next.js` cliente, HTML público)
- repositorios Git
- capturas de pantalla
- mensajes pegados en issues o chats públicos
- documentación pública
- backups sin cifrar repartidos por carpetas

## Ejemplos de cosas que NO deberías subir

- `OPENAI_API_KEY=...` dentro de un commit
- conexión real a Postgres en un README
- token de n8n pegado en un workflow exportado
- credenciales de producción en `.env` dentro del repo

## Sitios correctos

- `.env` local no versionado
- gestor de secretos del hosting o plataforma
- variables de entorno del servidor
- vault o gestor seguro si el proyecto ya lo requiere

## Regla simple

Si el navegador del usuario puede ver el valor, no es un secreto.

## Antes de hacer push

Comprueba siempre:
- si has tocado `.env`
- si has pegado logs con tokens
- si has subido exports con credenciales
- si una IA te ha metido una key de ejemplo que parece real

## Si ya la has subido

1. no la dejes ahí
2. rota la clave
3. bórrala del repo actual y del historial si hace falta
4. revisa accesos derivados
5. documenta el incidente

## Regla final

Más importante que saber qué es una API es saber que una clave real no debería acabar jamás en tu código público.
