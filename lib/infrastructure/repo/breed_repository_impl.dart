import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/infrastructure/mappers/breed_mapper.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedDatasource datasource;

  BreedRepositoryImpl(this.datasource);

  @override
  Future<Either<ErrorItem, List<Breed>>> getBreeds() async {
    try {
      final result = await datasource.getBreeds();
      return result.fold(
        ifLeft: (error) => Either.left(error),
        ifRight: (data) {
          final breeds = (data as List<dynamic>)
              .map((item) => BreedMapper.fromJson(item))
              .toList();
          return Either.right(breeds);
        },
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, Breed>> getBreedDetail(int id) {
    // TODO: implement getBreedDetail
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
