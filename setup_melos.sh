#!/bin/bash

# Script para configurar Melos en el PATH

echo "Configurando Melos..."

# Agregar Melos al PATH si no está ya
if [[ ":$PATH:" != *":$HOME/.pub-cache/bin:"* ]]; then
    echo "Agregando Melos al PATH..."
    echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    echo "✅ Melos agregado al PATH"
else
    echo "✅ Melos ya está en el PATH"
fi

# Verificar que Melos esté disponible
if command -v melos &> /dev/null; then
    echo "✅ Melos está disponible"
    melos --version
else
    echo "❌ Melos no está disponible. Intentando instalar..."
    dart pub global activate melos
fi

echo ""
echo "🎉 Configuración completada!"
echo "Ahora puedes usar comandos como:"
echo "  melos bootstrap"
echo "  melos test"
echo "  melos analyze"
echo "  melos run example" 