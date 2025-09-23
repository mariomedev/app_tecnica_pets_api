import 'package:app_tecnica_pets_api/domain/entites/image_breed.dart';
import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/infrastructure/mappers/breed_mapper.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedDatasource datasource;

  BreedRepositoryImpl(this.datasource);

  @override
  Future<Either<ErrorItem, List<Breed>>> getBreeds({
    int page = 0,
    int limit = 10,
  }) async {
    try {
      final result = await datasource.getBreeds(page: page, limit: limit);
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
  Future<Either<ErrorItem, List<Breed>>> searchBreeds(String query) async {
    try {
      final result = await datasource.searchBreeds(query);
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
  Future<Either<ErrorItem, Breed>> getBreedDetail(int id) async {
    try {
      final result = await datasource.getBreedDetail(id);
      return result.fold(
        ifLeft: (error) => Either.left(error),
        ifRight: (data) {
          final breed = BreedMapper.fromJson(data);
          return Either.right(breed);
        },
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

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

  @override
  Future<Either<ErrorItem, String>> getImageBreed(int id) async {
    try {
      final result = await datasource.getImageBreed(id);
      return result.fold(
        ifLeft: (error) => Either.left(error),
        ifRight: (data) {
          final image = ImageBreed.fromJson((data as List).first);
          return Either.right(image.url);
        },
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }
}
