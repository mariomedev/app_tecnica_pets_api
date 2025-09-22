import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class ToggleFavoriteBreed {
  final BreedRepository repository;
  ToggleFavoriteBreed(this.repository);

  Future<Either<ErrorItem, void>> call(Breed breed) async {
    return await repository.toggleFavorite(breed);
  }
}
