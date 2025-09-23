import 'package:dart_either/dart_either.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class GetImageBreed {
  final BreedRepository repository;

  GetImageBreed(this.repository);

  Future<Either<ErrorItem, String>> call(int id) async {
    return await repository.getImageBreed(id);
  }
}
