import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/models.dart';

class ActorProvider extends ChangeNotifier {
  final String _apiKey = '0474b3318f65250aef7e3033a7e1d8ff';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es';

  Map<int, List<Actor>> actorDetails = {};
}
