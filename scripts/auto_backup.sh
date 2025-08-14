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
