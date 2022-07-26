import 'package:flutter/material.dart';
import 'package:peliculas_curso/providers/providers.dart';
import 'package:peliculas_curso/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            CardSwiper(movies: moviesProvider.nowPlayingMovies),
            SizedBox(height: size.height * 0.04),
            MovieSlider(
                popularMovies: moviesProvider.popularMovies,
                onNextPage: moviesProvider.getPopularMovies)
          ]),
        ));
  }
}
