import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/providers/movies/movies_repository_provider.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: movieRepository);
});

typedef GetMovieCallback = Future<Movie>Function(String movieId);

// cache local 
// se guardan las peliculas que ya hicieron la peticion para que no se repita
class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }): super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return; // valida si existe para no guardar
    final movie = await getMovie(movieId);
    // actualizacion al estado - generando un nuevo estado
    state = { ...state, movieId: movie };
  }

}