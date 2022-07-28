import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_curso/helpers/debouncer.dart';
import 'package:peliculas_curso/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '0474b3318f65250aef7e3033a7e1d8ff';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _pageNumber = 0;

  final StreamController<List<Movie>> _streamController =
      StreamController.broadcast();
  Stream<List<Movie>> get stream => _streamController.stream;
  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

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
        await _getJsonData('3/movie/popular', page: _pageNumber));
    popularMovies = [...popularMovies, ...moviesListResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final castResponse = CastResponse.fromJson(jsonData);
    moviesCast[movieId] = castResponse.cast as List<Cast>;
    return castResponse.cast as List<Cast>;
  }

  Future<List<Movie>> getSearchMovies(String query) async {
    final jsonData = await _getJsonData('3/search/movie', query: query);
    final searchMovieResponse = SearchMoviesResponse.fromJson(jsonData);
    return searchMovieResponse.results;
  }

  Future<String> _getJsonData(String endpoint,
      {int page = 1, String query = ''}) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
      'query': query
    });

    final response = await http.get(url);
    return response.body;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      // print('Tenemos valor a buscar: $value');
      final results = await getSearchMovies(value);
      _streamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => timer.cancel());
  }
}
