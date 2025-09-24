import 'package:dio/dio.dart';
import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class BreedDatasourceApidog implements BreedDatasource {
  final Dio dioClient;

  BreedDatasourceApidog({required this.dioClient});

  @override
  Future<Either<ErrorItem, dynamic>> getBreeds({
    int page = 0,
    int limit = 10,
  }) async {
    try {
      final response = await dioClient.get('v1/breeds?limit=$limit&page=$page');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        return Either.right(data);
      } else {
        return Either.left(
          ErrorItem(
            code: '${response.statusCode ?? 500}',
            message: 'Error en la respuesta del servidor',
          ),
        );
      }
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, dynamic>> searchBreeds(String query) async {
    try {
      final response = await dioClient.get('v1/breeds/search?q=$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        return Either.right(data);
      } else {
        return Either.left(
          ErrorItem(
            code: '${response.statusCode ?? 500}',
            message: 'Error en la respuesta del servidor',
          ),
        );
      }
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, dynamic>> getBreedDetail(int id) async {
    try {
      final response = await dioClient.get('v1/breeds/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        return Either.right(data);
      } else {
        return Either.left(
          ErrorItem(
            code: '${response.statusCode ?? 500}',
            message: 'Error en la respuesta del servidor',
          ),
        );
      }
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, dynamic>> getImageBreed(int id) async {
    try {
      final response = await dioClient.get('v1/images/search?breed_ids=$id');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        return Either.right(data);
      } else {
        return Either.left(
          ErrorItem(
            code: '${response.statusCode ?? 500}',
            message: 'Error en la respuesta del servidor',
          ),
        );
      }
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }
}
