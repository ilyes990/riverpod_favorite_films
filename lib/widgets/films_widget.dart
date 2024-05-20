import 'package:example6/Riverpod/riverpod.dart';
import 'package:example6/films.dart';
import 'package:example6/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilmsWidget extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;

  FilmsWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
      child: ListView.builder(
          itemCount: films.length,
          itemBuilder: (context, index) {
            final film = films.elementAt(index);
            final favoriteIcon =
                film.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
            return ListTile(
              title: Text(
                film.title,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              subtitle: Text(
                film.description,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              trailing: IconButton(
                  onPressed: () {
                    final isFavorite = !film.isFavorite;
                    ref.read(allfilmsProvider.notifier).update(film, isFavorite);
                  },
                  icon: favoriteIcon),
            );
          }),
    );
  }
}
