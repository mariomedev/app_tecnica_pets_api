import 'package:dio/dio.dart';
import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/core/error/error_item.dart';

class BreedFavoriteDatasoureApidog implements BreedFavoriteDatasource {
  final Dio dioClient;

  BreedFavoriteDatasoureApidog({required this.dioClient});
  @override
  Future<Either<ErrorItem, dynamic>> getFavoriteBreeds() async {
    try {
      final response = await dioClient.get('v1/favourites');
      if (response.statusCode == 200) {
        final List<dynamic> favourites = response.data as List<dynamic>;
        final futures = favourites.map((fav) async {
          final imageId =
              fav['image_id'] as String? ?? fav['image']?['id'] as String?;
          if (imageId == null || imageId.isEmpty) return null;
          try {
            final imgResp = await dioClient.get('v1/images/$imageId');
            if (imgResp.statusCode == 200) return imgResp.data;
          } catch (_) {}
          return null;
        });
        final results = await Future.wait(futures);
        final images = results.where((e) => e != null).toList();
        return Either.right(images);
      } else {
        return Either.left(
          ErrorItem(
            code: '${response.statusCode ?? 500}',
            message: 'Error to get favorite breeds',
          ),
        );
      }
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorItem, dynamic>> toggleFavorite(Breed breed) async {
    try {
      final favsResp = await dioClient.get('v1/favourites');
      if (favsResp.statusCode != 200) {
        return Either.left(
          ErrorItem(
            code: '${favsResp.statusCode ?? 500}',
            message: 'Error to get favorites',
          ),
        );
      }

      final List<dynamic> favourites = favsResp.data as List<dynamic>;
      final match = favourites.firstWhere(
        (f) => (f['image_id'] as String?) == breed.referenceImageId,
        orElse: () => null,
      );

      if (match != null) {
        final favId = match['id'];
        final delResp = await dioClient.delete('v1/favourites/$favId');
        if (delResp.statusCode == 200) {
          return const Either.right(null);
        } else {
          return Either.left(
            ErrorItem(
              code: '${delResp.statusCode ?? 500}',
              message: 'Error to remove from favorites',
            ),
          );
        }
      }

      final createResp = await dioClient.post(
        'v1/favourites',
        data: {
          'image_id': breed.referenceImageId,
        },
      );
      if (createResp.statusCode == 200 || createResp.statusCode == 201) {
        return const Either.right(null);
      }

      return Either.left(
        ErrorItem(
          code: '${createResp.statusCode ?? 500}',
          message: 'Error to add to favorites',
        ),
      );
    } catch (e) {
      return Either.left(ErrorItem(message: e.toString()));
    }
  }
}
