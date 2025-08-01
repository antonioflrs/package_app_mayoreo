import 'package:flutter/material.dart';
// ¡Importamos nuestra librería!
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de Librería'),
        ),
        body: Center(
          // ¡Y aquí usamos nuestro botón!
          child: PrimaryButton(
            text: '¡Funciona!',
            onPressed: () {
              debugPrint('Botón de la librería presionado!');
            },
          ),
        ),
      ),
    );
  }
}