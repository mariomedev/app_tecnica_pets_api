import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class BreedDatasourceApidog implements BreedDatasource {
  @override
  Future<Either<ErrorItem, Breed>> getBreedDetail(int id) {
    // TODO: implement getBreedDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, List<Breed>>> getBreeds() {
    // TODO: implement getBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, List<Breed>>> getFavoriteBreeds() {
    // TODO: implement getFavoriteBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, List<Breed>>> searchBreeds(String query) {
    // TODO: implement searchBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, void>> toggleFavorite(Breed breed) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
