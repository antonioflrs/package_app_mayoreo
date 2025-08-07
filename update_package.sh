#!/bin/bash

echo "🔄 Actualizando flutter_package_app_mayoreo..."

# Actualizar repositorio
echo "📥 Actualizando repositorio..."
git pull origin main

# Limpiar cache
echo "🧹 Limpiando cache..."
flutter clean

# Obtener dependencias
echo "📦 Obteniendo dependencias..."
flutter pub get

# Verificar que todo funcione
echo "✅ Verificando integración..."
cd example
flutter pub get
echo "🎯 Package actualizado correctamente!"
echo "💡 Ejecuta 'flutter run' en el directorio example para probar la integración"
