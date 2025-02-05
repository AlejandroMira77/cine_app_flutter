import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cine_app/presentation/providers/providers.dart';
import 'package:cine_app/domain/entities/movie.dart';

// la clase que lo controla o que sirve para notificar = MoviesNotifier
// y la data o state es list<movie>
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// define el caso de uso, en el MoviesNotifier para cargar mas pelis debe llamar esta funcion
typedef MovieCallback = Future<List<Movie>> Function({ int page });

class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  
  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    // el state es un List<Movie>
    state = [...state, ...movies];
  }
}