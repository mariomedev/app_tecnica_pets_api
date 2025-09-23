import 'package:dio/dio.dart';
import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/core/error/error_item.dart';

class BreedFavoriteDatasoureApidog implements BreedFavoriteDatasource {
  final Dio dioClient;

  BreedFavoriteDatasoureApidog({required this.dioClient});
  @override
  Future<Either<ErrorItem, dynamic>> getFavoriteBreeds() {
    // TODO: implement getFavoriteBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorItem, dynamic>> toggleFavorite(Breed breed) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
