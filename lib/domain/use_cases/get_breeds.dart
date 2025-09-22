import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class GetBreeds {
  final BreedRepository repository;
  GetBreeds(this.repository);

  Future<Either<ErrorItem, List<Breed>>> call() async {
    return await repository.getBreeds();
  }
}
