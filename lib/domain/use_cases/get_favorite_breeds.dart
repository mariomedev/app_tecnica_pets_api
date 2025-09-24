import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';

class GetFavoriteBreeds {
  final BreedFavoriteRepository repository;
  GetFavoriteBreeds(this.repository);

  Future<Either<ErrorItem, List<Breed>>> call() async {
    return await repository.getFavoriteBreeds();
  }
}
