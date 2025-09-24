import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

abstract class BreedFavoriteRepository {
  Future<Either<ErrorItem, void>> toggleFavorite(Breed breed);
  Future<Either<ErrorItem, List<Breed>>> getFavoriteBreeds();
}
