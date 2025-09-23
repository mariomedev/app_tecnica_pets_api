import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/infrastructure/infrastructure.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BreedProvider(
            repository: BreedRepositoryImpl(
              BreedDatasourceApidog(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

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
