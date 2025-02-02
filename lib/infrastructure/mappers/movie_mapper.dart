import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/infrastructure/models/moviedb/movie_moviedb.dart';

// es una capa de proteccion de el api que viene con la app
// si algun dato como adult cambia solo toco el moviedb(MovieMovieDB) y listo
class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
    ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
    : 'https://static.displate.com/857x1200/displate/2024-04-10/ec27e01e31a774ab9a168d922d07c33e_ff36b6b0233da0913042c802de7948e5.jpg',
    // transformamos los int a strings
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );
}
