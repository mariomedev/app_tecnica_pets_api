import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

abstract class BreedRepository {
  Future<Either<ErrorItem, List<Breed>>> getBreeds();
  Future<Either<ErrorItem, List<Breed>>> searchBreeds(String query);
  Future<Either<ErrorItem, String>> getImageBreed(int id);
  Future<Either<ErrorItem, void>> toggleFavorite(Breed breed);
  Future<Either<ErrorItem, List<Breed>>> getFavoriteBreeds();
  Future<Either<ErrorItem, Breed>> getBreedDetail(int id);
}
