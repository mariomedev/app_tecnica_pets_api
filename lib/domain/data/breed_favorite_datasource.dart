import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

abstract class BreedFavoriteDatasource {
  Future<Either<ErrorItem, dynamic>> toggleFavorite(Breed breed);
  Future<Either<ErrorItem, dynamic>> getFavoriteBreeds();
}
