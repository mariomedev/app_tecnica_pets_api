import 'package:flutter/material.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class BreedProvider extends ChangeNotifier {
  final BreedRepository repository;

  BreedProvider({required this.repository}) {
    loadBreeds();
  }

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  final List<Breed> _breeds = [];
  List<Breed> get breeds => _breeds;

  final List<Breed> _favorites = [];
  List<Breed> get favorites => _favorites;

  Breed? _selectedBreed;
  Breed? get selectedBreed => _selectedBreed;

  Future<void> loadBreeds() async {
    _loading = true;
    notifyListeners();

    final result = await GetBreeds(repository)();
    await result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (value) async {
        final newBreedsList = await Future.wait(
          value.map((breed) async {
            final imageUrl = await _fetchImageForBreed(breed.id);
            return breed.copyWith(imageUrl: imageUrl);
          }),
        );
        _breeds.addAll(newBreedsList);
        _error = null;
      },
    );

    _loading = false;
    notifyListeners();
  }

  Future<void> search(String query) async {
    if (query.isEmpty || query.length < 2) {
      _breeds.clear();
      await loadBreeds();
      return;
    }

    _loading = true;
    notifyListeners();

    final result = await SearchBreeds(repository)(query);
    await result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (value) async {
        final newBreedsList = await Future.wait(
          value.map((breed) async {
            final imageUrl = await _fetchImageForBreed(breed.id);
            return breed.copyWith(imageUrl: imageUrl);
          }),
        );
        _breeds.clear();
        _breeds.addAll(newBreedsList);
        _error = null;
      },
    );

    _loading = false;
    notifyListeners();
  }

  Future<String?> _fetchImageForBreed(int id) async {
    final result = await GetImageBreed(repository)(id);
    String? imageUrl;
    result.fold(
      ifLeft: (_) => null,
      ifRight: (value) => imageUrl = value,
    );
    return imageUrl;
  }

  Future<void> loadFavorites() async {
    _loading = true;
    notifyListeners();

    _loading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(Breed breed) async {
    _loading = true;
    notifyListeners();

    _loading = false;
    notifyListeners();
  }

  Future<void> loadBreedDetail(int id) async {
    _loading = true;
    notifyListeners();

    _loading = false;
    notifyListeners();
  }

  void clearSelected() {
    _selectedBreed = null;
    notifyListeners();
  }
}
