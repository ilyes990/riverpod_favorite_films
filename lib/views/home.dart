import 'package:example6/Riverpod/riverpod.dart';
import 'package:example6/enums.dart';
import 'package:example6/main.dart';
import 'package:example6/widgets/dropdown_widget.dart';
import 'package:example6/widgets/films_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
        title: Text(
          'Films',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        children: [
          FilterWidget(),
          Consumer(builder: (context, ref, child) {
            final filter = ref.watch(favoriteStatusProvider);
            switch (filter) {
              case FavoriteStatus.All:
                return FilmsWidget(provider: allfilmsProvider);

              case FavoriteStatus.Favorite:
                return FilmsWidget(provider: favoriteFilmsProvider);

              case FavoriteStatus.NotFavorite:
                return FilmsWidget(provider: notFavoriteFilmsProvider);
            }
          })
        ],
      ),
    );
  }
}
