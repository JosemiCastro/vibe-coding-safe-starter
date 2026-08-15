# Caso realista: landing publicada con variable o formulario roto

## Escenario
Cambiaste una landing, un CTA o un formulario.
Después del deploy la web carga, pero el formulario falla, el enlace principal no funciona o una variable pública quedó mal.

## Antes del deploy
- build correcta
- formularios y enlaces revisados
- dominio y SSL correctos
- versión anterior identificada

## Qué revisar nada más publicar
1. ¿abre la home?
2. ¿funcionan los CTAs?
3. ¿envía el formulario?
4. ¿hay errores visibles en consola o red?

## Si falla
1. vuelve al build anterior
2. limpia caché si aplica
3. vuelve a probar home, CTA y formulario
4. documenta qué parte pública quedó rota

## Qué NO hacer
- dejar la landing rota “porque la app principal va bien”
- publicar otro cambio encima sin recuperar la versión buena
- asumir que un error en formulario es menor si rompe captación

## Señal de que debiste frenar antes
Si no habías probado tú mismo el CTA o formulario exacto que cambiabas, el deploy iba sin validación real.
