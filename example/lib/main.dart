import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package App Mayoreo Demo',
      theme: FlutterPackageAppMayoreo.theme,
      home: const MyHomePage(title: 'Package App Mayoreo Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backCards,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle('Temas y Colores'),
            _buildThemeSection(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Sistema de Botones'),
            _buildButtonsSection(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Campos de Texto'),
            _buildTextFieldSection(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Tipografía'),
            _buildTypographySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipos de botones',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                UiButton(
                  onPressed: () => _showSnackBar('Botón primario presionado'),
                  label: 'Primario',
                  type: UiButtonType.primary,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón secundario presionado'),
                  label: 'Secundario',
                  type: UiButtonType.secondary,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón de texto presionado'),
                  label: 'Texto',
                  type: UiButtonType.text,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón destructivo presionado'),
                  label: 'Eliminar',
                  type: UiButtonType.destructive,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Botones con iconos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                UiButton(
                  onPressed: () => _showSnackBar('Guardar presionado'),
                  label: 'Guardar',
                  icon: Icons.save,
                  type: UiButtonType.primary,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Descargar presionado'),
                  label: 'Descargar',
                  icon: Icons.download,
                  iconPosition: UiButtonIconPosition.end,
                  type: UiButtonType.secondary,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Eliminar presionado'),
                  label: 'Eliminar',
                  icon: Icons.delete,
                  type: UiButtonType.destructive,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Buscar presionado'),
                  label: 'Buscar',
                  icon: Icons.search,
                  type: UiButtonType.text,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Tamaños de botones',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                UiButton(
                  onPressed: () => _showSnackBar('Botón pequeño'),
                  label: 'Pequeño',
                  size: UiButtonSize.small,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón mediano'),
                  label: 'Mediano',
                  size: UiButtonSize.medium,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón grande'),
                  label: 'Grande',
                  size: UiButtonSize.large,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Estados de botones',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                UiButton(
                  onPressed: () => _showSnackBar('Botón con carga'),
                  label: 'Cargando...',
                  isLoading: true,
                ),
                UiButton(
                  onPressed: null,
                  label: 'Deshabilitado',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Border Radius personalizado',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                UiButton(
                  onPressed: () => _showSnackBar('Botón cuadrado'),
                  label: 'Cuadrado',
                  borderRadius: 0,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón redondeado'),
                  label: 'Redondeado',
                  borderRadius: 12,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón muy redondeado'),
                  label: 'Muy redondeado',
                  borderRadius: 25,
                ),
                UiButton(
                  onPressed: () => _showSnackBar('Botón circular'),
                  label: 'Circular',
                  borderRadius: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection() {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Colores del tema actual',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildColorChip('Primary', theme.colorScheme.primary),
                _buildColorChip('Secondary', theme.colorScheme.secondary),
                _buildColorChip('Tertiary', theme.colorScheme.tertiary),
                _buildColorChip('Error', theme.colorScheme.error),
                _buildColorChip('Surface', theme.colorScheme.surface),
                _buildColorChip('Surface', theme.colorScheme.surface),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextFieldSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Campos de texto',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Ingresa tu email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              onChanged: (value) => debugPrint('Email: $value'),
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _passwordController,
              labelText: 'Contraseña',
              hintText: 'Ingresa tu contraseña',
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña es requerida';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              labelText: 'Búsqueda',
              hintText: 'Buscar productos...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.clear),
            ),
            const SizedBox(height: 16),
            Text(
              'Tamaños de campos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            AppTextField(
              labelText: 'Campo pequeño',
              hintText: 'Tamaño pequeño',
              size: AppTextFieldSize.small,
            ),
            const SizedBox(height: 8),
            AppTextField(
              labelText: 'Campo mediano',
              hintText: 'Tamaño mediano',
              size: AppTextFieldSize.medium,
            ),
            const SizedBox(height: 8),
            AppTextField(
              labelText: 'Campo grande',
              hintText: 'Tamaño grande',
              size: AppTextFieldSize.large,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographySection() {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estilos de tipografía',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Display Large',
              style: theme.textTheme.displayLarge,
            ),
            Text(
              'Display Medium',
              style: theme.textTheme.displayMedium,
            ),
            Text(
              'Display Small',
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Headline Large',
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              'Headline Medium',
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              'Headline Small',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Title Large',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              'Title Medium',
              style: theme.textTheme.titleMedium,
            ),
            Text(
              'Title Small',
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Body Large - Este es un texto de ejemplo para mostrar el estilo body large.',
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              'Body Medium - Este es un texto de ejemplo para mostrar el estilo body medium.',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              'Body Small - Este es un texto de ejemplo para mostrar el estilo body small.',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Label Large',
              style: theme.textTheme.labelLarge,
            ),
            Text(
              'Label Medium',
              style: theme.textTheme.labelMedium,
            ),
            Text(
              'Label Small',
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}