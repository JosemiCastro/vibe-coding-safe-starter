# Changelog

Cambios relevantes de este repositorio.

## Unreleased

### Added
-

### Changed
-

### Fixed
-

## 0.2.1 — 2026-08-15

### Fixed
- el backup falla si se solicitó PostgreSQL y `pg_dump` no puede completarse
- los backups parciales requieren autorización explícita y quedan marcados
- el predeploy redacta los valores de posibles secretos
- el predeploy exige manifiesto, checksums y archivo legible
- las pruebas ya no aceptan directorios de backup vacíos
- GitHub Actions fijadas a commits inmutables

## 0.2.0 — 2026-08-15

### Added
- ruta rápida `START_HERE` en español e inglés
- plan de rollback y política de seguridad
- verificación de backups y validación automática del repositorio
- checklists para pagos, migraciones, APIs externas y roles admin
- plantillas de issues y pull requests
- workflow de calidad
- reglas de formato y finales de línea consistentes

### Changed
- README español e inglés orientados a decisiones y navegación directa
- scripts de backup y predeploy con controles más seguros
- checklists existentes ampliados
- plantilla de incidente y prompt seguro reforzados

### Fixed
- exclusiones de `tar` colocadas antes del contenido archivado
- `.env` excluido del backup general por defecto
