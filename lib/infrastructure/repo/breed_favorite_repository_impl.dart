import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/core/error/error_item.dart';
import 'package:app_tecnica_pets_api/infrastructure/mappers/breed_mapper.dart';

class BreedFavoriteRepositoryImpl implements BreedFavoriteRepository {
  final BreedFavoriteDatasource datasource;

  BreedFavoriteRepositoryImpl(this.datasource);

  @override
  Future<Either<ErrorItem, List<Breed>>> getFavoriteBreeds() async {
    try {
      final result = await datasource.getFavoriteBreeds();
      return result.fold(
        ifLeft: (error) => Either.left(error),
        ifRight: (data) {
          final breeds = (data as List<dynamic>).map((img) {
            final List<dynamic>? breedsList = img['breeds'] as List<dynamic>?;
            final imageUrl = img['url'] as String?;
            final imageId = img['id'] as String? ?? '';

            if (breedsList != null && breedsList.isNotEmpty) {
              final breedJson = breedsList.first as Map<String, dynamic>;
              final mapped = BreedMapper.fromJson(breedJson).copyWith(
                imageUrl: imageUrl,
              );
              return mapped;
            }

            return Breed(
              weight: Measurement(imperial: '-', metric: '-'),
              height: Measurement(imperial: '-', metric: '-'),
              id: -1,
              name: 'Unknown',
              lifeSpan: 'Unknown',
              temperament: 'Unknown',
              referenceImageId: imageId,
              imageUrl: imageUrl,
            );
          }).toList();
          return Either.right(breeds);
        },
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, void>> toggleFavorite(Breed breed) async {
    try {
      final result = await datasource.toggleFavorite(breed);
      return result.fold(
        ifLeft: (error) => Either.left(error),
        ifRight: (_) => const Either.right(null),
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }
}
