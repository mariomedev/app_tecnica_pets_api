import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';

abstract class BreedDatasource {
  Future<Either<ErrorItem, dynamic>> getBreeds({int page = 0, int limit = 10});
  Future<Either<ErrorItem, dynamic>> searchBreeds(String query);
  Future<Either<ErrorItem, dynamic>> getImageBreed(int id);
  Future<Either<ErrorItem, dynamic>> getBreedDetail(int id);
}
