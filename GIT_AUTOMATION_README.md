# 🚀 Git Automation - Guía de Uso

## Descripción
Este sistema automatiza el workflow de Git de forma segura, incluyendo validaciones, commits automáticos y sincronización.

## Comandos Principales

### Workflow Automatizado
- `git wf-status` - Ver estado del repositorio
- `git wf-auto` - Commit automático con timestamp
- `git wf-commit "mensaje"` - Commit con mensaje personalizado
- `git wf-merge <rama>` - Merge seguro de rama
- `git wf-push` - Push con validaciones

### Alias Útiles
- `git st` - Status
- `git co <rama>` - Checkout
- `git br` - Listar ramas
- `git ci` - Commit
- `git lg` - Log gráfico
- `git ll` - Log compacto

### Scripts Adicionales
- `./scripts/safe_merge.sh <origen> <destino>` - Merge seguro entre ramas
- `./scripts/auto_backup.sh` - Backup automático del repositorio

## Hooks Automáticos

### Pre-commit
- Verifica cambios pendientes
- Valida archivos grandes
- Detecta credenciales
- Verifica conflictos

### Post-commit
- Sincroniza con remoto
- Crea Pull Requests automáticos
- Actualiza ramas

### Pre-push
- Validaciones de seguridad
- Verificación de archivos prohibidos
- Control de credenciales

## Configuración

### Archivos de Configuración
- `.gitconfig` - Alias y configuración local
- `scripts/git_security.conf` - Reglas de seguridad
- `.gitignore` - Archivos ignorados

### Personalización
1. Edita `scripts/git_security.conf` para ajustar reglas
2. Modifica `.gitconfig` para personalizar alias
3. Ajusta hooks en `.git/hooks/`

## Seguridad

### Validaciones Automáticas
- ✅ No archivos grandes (>10MB)
- ✅ No credenciales en código
- ✅ No archivos sensibles
- ✅ Formato de mensajes de commit
- ✅ Nombres de ramas válidos

### Ramas Protegidas
- main/master
- develop
- production
- staging

## Troubleshooting

### Problemas Comunes
1. **Hook no ejecutable**: `chmod +x .git/hooks/*`
2. **Permisos denegados**: Verificar permisos de archivos
3. **Scripts no encontrados**: Verificar ruta de scripts

### Logs
- Logs de seguridad: `.git/logs/security.log`
- Logs de Git: `.git/logs/`

## Soporte
Para problemas o sugerencias, revisa los logs y la configuración de seguridad.
