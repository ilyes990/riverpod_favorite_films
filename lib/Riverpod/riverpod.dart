// DROPDOWN STATUS

import 'package:example6/enums.dart';
import 'package:example6/films.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteStatusProvider = StateProvider((_) => FavoriteStatus.All);

// ALL

final allfilmsProvider = StateNotifierProvider<FilmsNotifier, List<Film>>((_) => FilmsNotifier());

// FAVORITE

final favoriteFilmsProvider =
    Provider<Iterable<Film>>((ref) => ref.watch(allfilmsProvider).where((film) => film.isFavorite));

// NOT FAVORITE

final notFavoriteFilmsProvider = Provider<Iterable<Film>>(
    (ref) => ref.watch(allfilmsProvider).where((film) => !film.isFavorite));

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(films);
  void update(Film film, bool isFavorite) {
    state = state
        .map(
            (thisfilm) => thisfilm.id == film.id ? thisfilm.copy(isFavorite: isFavorite) : thisfilm)
        .toList();
  }
}
