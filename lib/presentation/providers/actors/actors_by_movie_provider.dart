import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cine_app/domain/entities/actor.dart';
import 'package:cine_app/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieProvider, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieProvider(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieProvider extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActors;

  ActorsByMovieProvider({
    required this.getActors
  }): super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors };
  }

}