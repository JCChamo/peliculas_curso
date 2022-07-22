import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/models.dart';
import 'package:peliculas_curso/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({Key? key, required this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          );
        }
        return Container(
          width: double.infinity,
          height: 180,
          margin: const EdgeInsets.only(bottom: 30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, int index) {
              return const CastCard();
            },
          ),
        );
      },
    );
  }
}

class CastCard extends StatelessWidget {
  const CastCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x300'),
              height: 140,
              width: 100,
              fit: BoxFit.cover),
        ),
        const SizedBox(height: 5),
        const Text(
          'actor.name sgvdvsss svdsd',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
