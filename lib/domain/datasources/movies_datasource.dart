import 'package:cine_app/domain/entities/movie.dart';

// esta clase va a definir como se ve los origenes de datos
// va a definir los metodos que van a tener para traer esa data
abstract class MoviesDatasource {

  // trae las peliculas actuales en cartelera - pero no implementar el metodo
  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({ int page = 1 });

  Future<List<Movie>> getUpcoming({ int page = 1 });

  Future<List<Movie>> getTopRated({ int page = 1 });

  Future<Movie> getMovieById(String id);

}