import 'package:cine_app/domain/entities/actor.dart';
import 'package:cine_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity(Cast cast) => 
  Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath }'
    : 'https://static.displate.com/857x1200/displate/2024-04-10/ec27e01e31a774ab9a168d922d07c33e_ff36b6b0233da0913042c802de7948e5.jpg',
    character: cast.character
  );
}