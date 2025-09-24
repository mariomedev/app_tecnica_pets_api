import 'package:app_tecnica_pets_api/presentation/screens/home/breeds/view_favorites_breeds.dart';
import 'package:flutter/material.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/presentation/screens/home/breeds/view_breeds.dart';
import 'package:app_tecnica_pets_api/presentation/screens/home/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TapbarCustomWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.kPadding10,
            vertical: AppDimensions.kPadding30,
          ),
          child: TabBarView(
            children: [
              const ViewBreeds(),
              Builder(
                builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.read<BreedFavoriteProvider>().loadFavorites();
                  });
                  return const ViewFavorites();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
