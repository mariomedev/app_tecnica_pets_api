import 'package:flutter/material.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/presentation/screens/home/widgets/widgets.dart';

class ViewBreeds extends StatelessWidget {
  const ViewBreeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return CardCustomWidget(
          breed: Breed(
            id: 1,
            name: 'Breed $index',
            description: 'Description for Breed $index',
            origin: 'Origin $index',
            temperament: 'Temperament $index',
            lifeSpan: '10-12 years',
            weight: Measurement(imperial: '20-30', metric: '9-14'),
            height: Measurement(imperial: '15-20', metric: '38-51'),
            referenceImageId: 'abc123',
          ),
        );
      },
    );
  }
}
