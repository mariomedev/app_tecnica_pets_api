import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class GetBreedDetail {
  final BreedRepository repository;
  GetBreedDetail(this.repository);

  Future<Either<ErrorItem, Breed>> call(int id) async {
    return await repository.getBreedDetail(id);
  }
}
