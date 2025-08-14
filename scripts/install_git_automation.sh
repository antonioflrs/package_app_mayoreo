#!/bin/bash

# Script de instalación para automatización de Git
# Este script configura todos los hooks y scripts necesarios

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Función para verificar dependencias
check_dependencies() {
    log_step "Verificando dependencias..."
    
    # Verificar Git
    if ! command -v git >/dev/null 2>&1; then
        log_error "Git no está instalado. Instálalo primero."
        exit 1
    fi
    
    # Verificar Bash
    if ! command -v bash >/dev/null 2>&1; then
        log_error "Bash no está disponible. Este script requiere Bash."
        exit 1
    fi
    
    # Verificar que estemos en un repositorio Git
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        log_error "No estás en un repositorio Git. Ejecuta este script desde un repositorio Git."
        exit 1
    fi
    
    log_info "✅ Dependencias verificadas"
}

# Función para crear directorios necesarios
create_directories() {
    log_step "Creando directorios necesarios..."
    
    # Crear directorio de scripts si no existe
    mkdir -p scripts
    
    # Crear directorio de logs
    mkdir -p .git/logs
    
    # Crear directorio de backups
    mkdir -p .git/backups
    
    log_info "✅ Directorios creados"
}

# Función para configurar hooks de Git
setup_git_hooks() {
    log_step "Configurando hooks de Git..."
    
    # Hacer los hooks ejecutables
    chmod +x .git/hooks/pre-commit
    chmod +x .git/hooks/post-commit
    
    # Crear hook de pre-push
    cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash
# Hook de pre-push para validaciones adicionales

set -e

echo "🔒 Validando cambios antes del push..."

# Verificar que no haya credenciales
if git diff --cached | grep -i -E "(password|secret|key|token|api_key)" | grep -v "example\|test\|dummy"; then
    echo "❌ ERROR: Posibles credenciales detectadas. Revisa antes de hacer push."
    exit 1
fi

# Verificar que no haya archivos grandes
large_files=$(git diff --cached --name-only | xargs -I {} find {} -size +10M 2>/dev/null || true)
if [ ! -z "$large_files" ]; then
    echo "❌ ERROR: Archivos grandes detectados. No se permite el push."
    echo "$large_files"
    exit 1
fi

echo "✅ Validaciones de pre-push exitosas"
EOF

    # Hacer ejecutable el hook de pre-push
    chmod +x .git/hooks/pre-push
    
    log_info "✅ Hooks de Git configurados"
}

# Función para configurar alias de Git
setup_git_aliases() {
    log_step "Configurando alias de Git..."
    
    # Verificar si ya existe .gitconfig
    if [ -f .gitconfig ]; then
        log_warning "El archivo .gitconfig ya existe. Se sobrescribirá."
        read -p "¿Continuar? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "Instalación cancelada"
            exit 0
        fi
    fi
    
    # Copiar configuración
    cp .gitconfig .git/config.local 2>/dev/null || true
    
    log_info "✅ Alias de Git configurados"
}

# Función para crear archivo de configuración global
setup_global_config() {
    log_step "Configurando configuración global de Git..."
    
    # Crear archivo de configuración global si no existe
    if [ ! -f ~/.gitconfig ]; then
        cat > ~/.gitconfig << 'EOF'
[user]
    name = Tu Nombre
    email = tu.email@ejemplo.com

[core]
    editor = code --wait
    autocrlf = input
    safecrlf = warn

[init]
    defaultBranch = main

[push]
    default = current
    followTags = true

[pull]
    rebase = false

[merge]
    ff = false

[color]
    ui = auto
EOF
        log_warning "Archivo ~/.gitconfig creado. Actualiza tu nombre y email."
    else
        log_info "Archivo ~/.gitconfig ya existe"
    fi
}

# Función para crear archivo .gitignore mejorado
setup_gitignore() {
    log_step "Configurando .gitignore..."
    
    # Verificar si ya existe .gitignore
    if [ -f .gitignore ]; then
        log_warning "El archivo .gitignore ya existe. Se agregarán reglas de seguridad."
        
        # Agregar reglas de seguridad si no existen
        if ! grep -q "# Reglas de seguridad" .gitignore; then
            cat >> .gitignore << 'EOF'

# Reglas de seguridad
*.key
*.pem
*.p12
*.pfx
*.crt
*.cer
*.der
*.p7b
*.p7c
*.p8
.env
config.json
secrets.json
credentials.json
*.log
*.tmp
*.temp
*.cache
*.bak
*.backup

# Directorios de sistema
.DS_Store
Thumbs.db
desktop.ini

# Directorios de build
build/
dist/
node_modules/
*.pyc
__pycache__/
EOF
        fi
    else
        # Crear .gitignore completo
        cat > .gitignore << 'EOF'
# Reglas de seguridad
*.key
*.pem
*.p12
*.pfx
*.crt
*.cer
*.der
*.p7b
*.p7c
*.p8
.env
config.json
secrets.json
credentials.json
*.log
*.tmp
*.temp
*.cache
*.bak
*.backup

# Directorios de sistema
.DS_Store
Thumbs.db
desktop.ini

# Directorios de build
build/
dist/
node_modules/
*.pyc
__pycache__/

# Archivos de IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Archivos temporales
*.tmp
*.temp
*.cache
EOF
    fi
    
    log_info "✅ .gitignore configurado"
}

# Función para crear script de backup automático
create_backup_script() {
    log_step "Creando script de backup automático..."
    
    cat > scripts/auto_backup.sh << 'EOF'
#!/bin/bash

# Script de backup automático para el repositorio

set -e

BACKUP_DIR=".git/backups"
RETENTION_DAYS=30
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# Crear directorio de backup si no existe
mkdir -p "$BACKUP_DIR"

# Crear backup
echo "📦 Creando backup: $BACKUP_NAME"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" --exclude='.git' --exclude='node_modules' --exclude='build' --exclude='dist' .

# Limpiar backups antiguos
echo "🧹 Limpiando backups antiguos..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -delete

echo "✅ Backup completado: $BACKUP_NAME"
EOF

    chmod +x scripts/auto_backup.sh
    
    log_info "✅ Script de backup creado"
}

# Función para crear documentación
create_documentation() {
    log_step "Creando documentación..."
    
    cat > GIT_AUTOMATION_README.md << 'EOF'
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
EOF

    log_info "✅ Documentación creada"
}

# Función principal de instalación
main() {
    echo "🚀 Instalador de Automatización de Git"
    echo "======================================"
    
    # Verificar dependencias
    check_dependencies
    
    # Crear directorios
    create_directories
    
    # Configurar hooks
    setup_git_hooks
    
    # Configurar alias
    setup_git_aliases
    
    # Configurar configuración global
    setup_global_config
    
    # Configurar .gitignore
    setup_gitignore
    
    # Crear script de backup
    create_backup_script
    
    # Crear documentación
    create_documentation
    
    echo ""
    log_info "🎉 Instalación completada exitosamente!"
    echo ""
    echo "📚 Próximos pasos:"
    echo "1. Revisa GIT_AUTOMATION_README.md para aprender a usar el sistema"
    echo "2. Actualiza tu nombre y email en ~/.gitconfig"
    echo "3. Prueba los comandos: git wf-status"
    echo "4. Personaliza la configuración según tus necesidades"
    echo ""
    echo "🔒 El sistema está configurado con validaciones de seguridad automáticas"
}

# Ejecutar instalación
main "$@"
