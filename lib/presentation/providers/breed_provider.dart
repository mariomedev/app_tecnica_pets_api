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
    result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (value) {
        _breeds.clear();
        _breeds.addAll(value);
        _error = null;
      },
    );
    _loading = false;
    notifyListeners();
  }

  Future<void> search(String query) async {
    if (query.isEmpty || query.length < 2) {
      loadBreeds();
      return;
    }
    _loading = true;
    notifyListeners();
    _breeds.clear();
    final result = await SearchBreeds(repository)(query);
    result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (value) {
        _breeds.addAll(value);
        _error = null;
      },
    );
    _loading = false;
    notifyListeners();
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
