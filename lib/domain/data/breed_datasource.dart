import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

abstract class BreedDatasource {
  Future<Either<ErrorItem, dynamic>> getBreeds();
  Future<Either<ErrorItem, dynamic>> searchBreeds(String query);
  Future<Either<ErrorItem, dynamic>> toggleFavorite(Breed breed);
  Future<Either<ErrorItem, dynamic>> getFavoriteBreeds();
  Future<Either<ErrorItem, dynamic>> getBreedDetail(int id);
}
