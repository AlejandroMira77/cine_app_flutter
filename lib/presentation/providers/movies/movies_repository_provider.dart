import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cine_app/infrastructure/datasources/moviedb_datasource_impl.dart';
import 'package:cine_app/infrastructure/repositories/movie_repository_impl.dart';

// este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});