
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cine_app/presentation/providers/providers.dart';
import 'package:cine_app/presentation/widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    // el .value.toList es para convertir el map a list
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
      body: MovieMasonry(movies: favoriteMovies)
    );
  }
}