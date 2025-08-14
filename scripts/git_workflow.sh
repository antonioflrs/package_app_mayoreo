#!/bin/bash

# Script principal de workflow de Git automatizado
# Este script maneja todo el proceso de commit y sincronización de forma segura

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
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

log_success() {
    echo -e "${PURPLE}[SUCCESS]${NC} $1"
}

# Función para mostrar ayuda
show_help() {
    echo "🚀 Git Workflow Automatizado"
    echo ""
    echo "Uso: $0 [OPCIONES]"
    echo ""
    echo "Opciones:"
    echo "  -c, --commit <mensaje>    Hacer commit con mensaje específico"
    echo "  -a, --auto-commit         Commit automático con timestamp"
    echo "  -m, --merge <origen>      Hacer merge de rama origen a actual"
    echo "  -p, --push                Solo hacer push de cambios"
    echo "  -s, --status              Mostrar estado del repositorio"
    echo "  -h, --help                Mostrar esta ayuda"
    echo ""
    echo "Ejemplos:"
    echo "  $0 -c 'Nueva funcionalidad'"
    echo "  $0 -m feature/nueva-funcionalidad"
    echo "  $0 -a"
    echo ""
}

# Función para verificar estado del repositorio
check_repo_status() {
    log_step "Verificando estado del repositorio..."
    
    # Verificar que estemos en un repositorio git
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        log_error "No estás en un repositorio Git"
        exit 1
    fi
    
    # Verificar cambios
    if git diff --quiet && git diff --cached --quiet; then
        log_warning "No hay cambios para commitear"
        return 1
    fi
    
    # Mostrar estado
    log_info "Estado del repositorio:"
    git status --short
    
    return 0
}

# Función para hacer commit automático
auto_commit() {
    log_step "Haciendo commit automático..."
    
    # Generar mensaje automático
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    commit_message="Auto-commit: $timestamp"
    
    # Agregar todos los cambios
    git add .
    
    # Hacer commit
    if git commit -m "$commit_message"; then
        log_success "Commit automático exitoso: $commit_message"
        return 0
    else
        log_error "Error al hacer commit automático"
        return 1
    fi
}

# Función para hacer commit con mensaje personalizado
custom_commit() {
    local message="$1"
    
    if [ -z "$message" ]; then
        log_error "Debes proporcionar un mensaje de commit"
        exit 1
    fi
    
    log_step "Haciendo commit con mensaje: $message"
    
    # Agregar todos los cambios
    git add .
    
    # Hacer commit
    if git commit -m "$message"; then
        log_success "Commit exitoso: $message"
        return 0
    else
        log_error "Error al hacer commit"
        return 1
    fi
}

# Función para sincronizar con remoto
sync_with_remote() {
    log_step "Sincronizando con repositorio remoto..."
    
    current_branch=$(git branch --show-current)
    
    # Verificar si hay remote
    if ! git remote get-url origin >/dev/null 2>&1; then
        log_warning "No hay remote 'origin' configurado"
        return 0
    fi
    
    # Fetch de cambios remotos
    log_info "Obteniendo cambios remotos..."
    git fetch origin
    
    # Verificar si hay cambios remotos
    if git rev-list HEAD...origin/$current_branch --count | grep -q "^[1-9]"; then
        log_warning "Hay cambios remotos. Haciendo pull..."
        git pull origin $current_branch
    else
        log_info "La rama local está actualizada"
    fi
    
    # Push de cambios locales
    log_info "Haciendo push de cambios locales..."
    if git push origin $current_branch; then
        log_success "Push exitoso a $current_branch"
    else
        log_error "Error al hacer push"
        return 1
    fi
    
    return 0
}

# Función para hacer merge
do_merge() {
    local source_branch="$1"
    
    if [ -z "$source_branch" ]; then
        log_error "Debes especificar la rama origen para el merge"
        exit 1
    fi
    
    log_step "Iniciando merge de $source_branch a la rama actual..."
    
    # Verificar que la rama origen existe
    if ! git show-ref --verify --quiet refs/heads/"$source_branch"; then
        log_error "La rama $source_branch no existe"
        exit 1
    fi
    
    # Hacer merge
    if git merge "$source_branch" --no-ff -m "Merge $source_branch into $(git branch --show-current)"; then
        log_success "Merge exitoso"
        return 0
    else
        log_error "Error durante el merge. Resuelve los conflictos manualmente"
        return 1
    fi
}

# Función principal
main() {
    echo "🚀 Git Workflow Automatizado"
    echo "================================"
    
    # Si no hay argumentos, mostrar estado
    if [ $# -eq 0 ]; then
        check_repo_status
        exit 0
    fi
    
    # Procesar argumentos
    while [[ $# -gt 0 ]]; do
        case $1 in
            -c|--commit)
                if check_repo_status; then
                    custom_commit "$2"
                    sync_with_remote
                fi
                shift 2
                ;;
            -a|--auto-commit)
                if check_repo_status; then
                    auto_commit
                    sync_with_remote
                fi
                shift
                ;;
            -m|--merge)
                do_merge "$2"
                shift 2
                ;;
            -p|--push)
                sync_with_remote
                shift
                ;;
            -s|--status)
                check_repo_status
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                log_error "Opción desconocida: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    log_success "Workflow completado exitosamente"
}

# Ejecutar función principal
main "$@"
