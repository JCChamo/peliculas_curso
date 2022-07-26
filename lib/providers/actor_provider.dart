import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/filmography_movie.dart';
import 'package:peliculas_curso/models/models.dart';
import 'package:http/http.dart' as http;

class ActorProvider extends ChangeNotifier {
  final String _apiKey = '0474b3318f65250aef7e3033a7e1d8ff';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es';

  Future<Actor> getActorDetails(int actorId) async {
    final actorResponse = await _getJsonData('3/person/$actorId');
    final actor = Actor.fromJson(actorResponse);
    return actor;
  }

  Future<List<FilmographyMovie>> getFilmography(int actorId) async {
    // if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await _getJsonData('3/person/$actorId/movie_credits');
    final castResponse = CastResponse.fromJson2(jsonData);
    final actorCast = castResponse.cast as List<FilmographyMovie>;
    return actorCast;
  }

  Future<String> _getJsonData(String endpoint) async {
    var url = Uri.https(
        _baseUrl, endpoint, {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    return response.body;
  }
}
