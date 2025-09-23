import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:app_tecnica_pets_api/presentation/screens/home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ViewBreeds extends StatelessWidget {
  const ViewBreeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BreedProvider>(
      builder: (context, provider, child) {
        if (provider.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.breeds.isEmpty) {
          return Center(
            child: Text(provider.error ?? 'No hay razas disponibles'),
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: provider.breeds.length,
            itemBuilder: (context, index) {
              final breed = provider.breeds[index];
              return CardCustomWidget(breed: breed);
            },
          );
        }
      },
    );
  }
}
