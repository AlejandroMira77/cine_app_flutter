import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) { // el ref tiene el scope de todos los providers
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0,6);
});