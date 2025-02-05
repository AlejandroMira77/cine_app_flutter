import 'package:dio/dio.dart';

import 'package:cine_app/config/constants/environment.dart';
import 'package:cine_app/domain/datasources/movies_datasource.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cine_app/infrastructure/mappers/movie_mapper.dart';

class MoviedbDatasource extends MoviesDatasource {
  
  // esta config es propio de este datasource
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((e) => e.posterPath != 'no-poster') // esto es un filtro si la condicion es true lo deja pasar
    // y asi no renderiza las peliculas que no tienen poster
    .map(
      (e) => MovieMapper.movieDBToEntity(e)
    ).toList();

    return movies;
  }
}