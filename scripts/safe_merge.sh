#!/bin/bash

# Script para merge automático seguro entre ramas
# Uso: ./scripts/safe_merge.sh <rama_origen> <rama_destino>

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

# Verificar argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <rama_origen> <rama_destino>"
    echo "Ejemplo: $0 feature/nueva-funcionalidad main"
    exit 1
fi

source_branch="$1"
target_branch="$2"

log_step "Iniciando merge seguro de $source_branch a $target_branch"

# 1. Verificar que estemos en la rama destino
current_branch=$(git branch --show-current)
if [ "$current_branch" != "$target_branch" ]; then
    log_info "Cambiando a rama destino: $target_branch"
    git checkout "$target_branch"
fi

# 2. Verificar que no haya cambios sin commitear
if ! git diff --quiet; then
    log_error "Hay cambios sin commitear en $target_branch. Commit o stash antes de continuar."
    exit 1
fi

# 3. Actualizar rama destino
log_step "Actualizando rama destino..."
git pull origin "$target_branch"

# 4. Verificar que la rama origen existe
if ! git show-ref --verify --quiet refs/heads/"$source_branch"; then
    log_error "La rama $source_branch no existe localmente"
    exit 1
fi

# 5. Verificar que no haya conflictos potenciales
log_step "Verificando conflictos potenciales..."
git fetch origin
git merge-tree $(git merge-base "$source_branch" "$target_branch") "$source_branch" "$target_branch" > /tmp/merge-tree-output 2>&1 || true

if grep -q "<<<<<<<" /tmp/merge-tree-output; then
    log_warning "Se detectaron conflictos potenciales. Revisa antes de continuar:"
    cat /tmp/merge-tree-output
    rm -f /tmp/merge-tree-output
    
    read -p "¿Deseas continuar con el merge? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "Merge cancelado por el usuario"
        exit 0
    fi
fi

rm -f /tmp/merge-tree-output

# 6. Ejecutar merge
log_step "Ejecutando merge..."
if git merge "$source_branch" --no-ff -m "Merge $source_branch into $target_branch"; then
    log_info "✅ Merge exitoso"
    
    # 7. Push automático
    log_step "Haciendo push de los cambios..."
    git push origin "$target_branch"
    
    # 8. Limpiar rama origen si se solicita
    read -p "¿Deseas eliminar la rama $source_branch? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        log_info "Eliminando rama $source_branch..."
        git branch -d "$source_branch"
        git push origin --delete "$source_branch" 2>/dev/null || log_warning "No se pudo eliminar la rama remota"
    fi
    
    log_info "🎉 Proceso de merge completado exitosamente"
else
    log_error "❌ Error durante el merge. Resuelve los conflictos manualmente."
    log_info "Comandos útiles:"
    log_info "  - git status (ver estado)"
    log_info "  - git add <archivo> (resolver conflictos)"
    log_info "  - git commit (completar merge)"
    log_info "  - git merge --abort (cancelar merge)"
    exit 1
fi
