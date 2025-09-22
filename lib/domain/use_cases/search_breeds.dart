import 'package:dart_either/dart_either.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class SearchBreeds {
  final BreedRepository repository;
  SearchBreeds(this.repository);

  Future<Either<ErrorItem, List<Breed>>> call(String query) async {
    return await repository.searchBreeds(query);
  }
}
