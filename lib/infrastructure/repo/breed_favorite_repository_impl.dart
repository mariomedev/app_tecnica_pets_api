import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/core/error/error_item.dart';

class BreedFavoriteRepositoryImpl implements BreedFavoriteRepository {
  final BreedFavoriteDatasource datasource;

  BreedFavoriteRepositoryImpl(this.datasource);

  @override
  Future<Either<ErrorItem, List<Breed>>> getFavoriteBreeds() {
    // TODO: implement getFavoriteBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, void>> toggleFavorite(Breed breed) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
