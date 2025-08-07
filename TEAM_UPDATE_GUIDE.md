# Guía de Actualización del Package - Equipo

## 🚀 Proceso de Actualización

### Opción 1: Script Automatizado (Recomendado)
```bash
./update_package.sh
```

### Opción 2: Pasos Manuales

1. **Actualizar repositorio**
   ```bash
   git pull origin main
   ```

2. **Limpiar y actualizar**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Verificar integración**
   ```bash
   cd example
   flutter pub get
   flutter run
   ```

## 📋 Checklist de Verificación

- [ ] Repositorio actualizado sin conflictos
- [ ] Dependencias instaladas correctamente
- [ ] Ejemplo ejecuta sin errores
- [ ] Componentes del package funcionan correctamente
- [ ] No hay breaking changes en el CHANGELOG.md

## 🔍 Qué Verificar Después de la Actualización

1. **Colores del sistema** - Verificar que la paleta de colores se muestre correctamente
2. **Tipografía** - Confirmar que los estilos de texto se apliquen
3. **Widgets** - Probar botones, campos de texto y otros componentes
4. **Iconos** - Verificar que los iconos se muestren correctamente
5. **Tema completo** - Confirmar que el tema se aplique en toda la app

## 🚨 En Caso de Problemas

1. **Conflictos de merge**: Resolver manualmente y verificar integridad
2. **Errores de dependencias**: Ejecutar `flutter doctor` y verificar versiones
3. **Problemas de assets**: Verificar que los archivos de fuentes e iconos estén presentes
4. **Errores de compilación**: Revisar logs y verificar compatibilidad de versiones

## 📞 Contacto

Si encuentras problemas durante la actualización, contacta al equipo de desarrollo o crea un issue en el repositorio.
