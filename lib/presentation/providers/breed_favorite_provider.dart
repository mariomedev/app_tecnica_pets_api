import 'package:flutter/widgets.dart';
import 'package:app_tecnica_pets_api/domain/domain.dart';

class BreedFavoriteProvider extends ChangeNotifier {
  final BreedFavoriteRepository repository;

  BreedFavoriteProvider({required this.repository}) {
    loadFavorites();
  }

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  final List<Breed> _favorites = [];

  List<Breed> get favorites => _favorites;

  Future<void> loadFavorites() async {
    _loading = true;
    notifyListeners();
    _favorites.clear();
    final result = await GetFavoriteBreeds(repository)();

    result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (value) {
        _favorites.addAll(value);
        _error = null;
      },
    );

    _loading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(Breed breed) async {
    _loading = true;
    notifyListeners();
    final result = await ToggleFavoriteBreed(repository)(breed);
    result.fold(
      ifLeft: (value) {
        _error = '${value.message} de tipo ${value.code}';
      },
      ifRight: (_) async {
        _error = null;
        await loadFavorites();
      },
    );
    _loading = false;
    notifyListeners();
  }
}
