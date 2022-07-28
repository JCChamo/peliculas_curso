import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/models.dart';
import 'package:peliculas_curso/providers/providers.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate<Movie> {
  @override
  String? get searchFieldLabel => "Buscar película";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);
    return StreamBuilder(
      stream: moviesProvider.stream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        }
        final movies = snapshot.data;
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (_, int index) {
            return MovieItem(movies[index], '${movies[index].title}-$index');
          },
        );
      },
    );
  }
}

Widget _emptyContainer() {
  return const Center(
      child: Icon(Icons.movie_creation_outlined,
          color: Colors.black38, size: 100));
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const MovieItem(this.movie, this.heroId);

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(movie.fullPosterPath),
            width: 50,
            fit: BoxFit.contain),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () =>
          Navigator.pushNamed(context, 'film-details', arguments: movie),
    );
  }
}
