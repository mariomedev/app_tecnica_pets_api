import 'package:flutter/material.dart';
import 'package:app_tecnica_pets_api/core/core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Prueba Técnica',
      routerConfig: AppRouter.routers,
      theme: AppTheme.getTheme(),
    );
  }
}
