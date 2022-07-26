import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/filmography_movie.dart';
import 'package:peliculas_curso/providers/actor_provider.dart';
import 'package:provider/provider.dart';

class FilmographyCards extends StatelessWidget {
  final int actorId;

  const FilmographyCards({Key? key, required this.actorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActorProvider actorProvider = Provider.of<ActorProvider>(context);

    return FutureBuilder(
      future: actorProvider.getFilmography(actorId),
      builder: (_, AsyncSnapshot<List<FilmographyMovie>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(children: <Widget>[
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  )
                ])),
          );
        } else {
          final filmography = snapshot.data;
          return Container(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filmography!.length,
              itemBuilder: (_, int index) {
                return FilmographyCard(filmography[index]);
              },
            ),
          );
        }
      },
    );
  }
}

class FilmographyCard extends StatelessWidget {
  final FilmographyMovie filmographyMovie;

  const FilmographyCard(this.filmographyMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    height: 140,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(filmographyMovie.fullPosterPath),
                    fit: BoxFit.cover)),
            const SizedBox(height: 5),
            AutoSizeText(
              filmographyMovie.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
