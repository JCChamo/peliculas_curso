import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_curso/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '0474b3318f65250aef7e3033a7e1d8ff';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  int _pageNumber = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    getNowPlayingMovies();
    getPopularMovies();
  }

  getNowPlayingMovies() async {
    final moviesListResponse =
        MoviesListResponse.fromJson(await _getJsonData('3/movie/now_playing'));
    nowPlayingMovies = moviesListResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _pageNumber++;
    final moviesListResponse = MoviesListResponse.fromJson(
        await _getJsonData('3/movie/popular', _pageNumber));
    popularMovies = [...popularMovies, ...moviesListResponse.results];
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    print("PÁGINA ===>" + page.toString());

    final response = await http.get(url);
    return response.body;
  }
}
