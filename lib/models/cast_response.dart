// To parse this JSON data, do
//
//     final castResponse = castResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_curso/models/filmography_movie.dart';
import 'package:peliculas_curso/models/models.dart';

class CastResponse {
  CastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<dynamic> cast;
  List<dynamic> crew;

  factory CastResponse.fromJson(String str) =>
      CastResponse.fromMap(json.decode(str));

  factory CastResponse.fromJson2(String str) =>
      CastResponse.fromMap2(json.decode(str));

  factory CastResponse.fromMap(Map<String, dynamic> json) => CastResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );

  factory CastResponse.fromMap2(Map<String, dynamic> json) => CastResponse(
        cast: List<FilmographyMovie>.from(
            json["cast"].map((x) => FilmographyMovie.fromMap(x))),
        crew: List<Movie>.from(json["crew"].map((x) => Movie.fromMap(x))),
        id: json["id"],
      );
}
