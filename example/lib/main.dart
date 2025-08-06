import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const DesignSystemApp());
}

class DesignSystemApp extends StatelessWidget {
  const DesignSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Mayoreo Design System',
      theme: FlutterPackageAppMayoreo.theme,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}