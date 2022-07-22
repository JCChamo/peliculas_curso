import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/models.dart';
import 'package:peliculas_curso/theme/app_theme.dart';
import 'package:peliculas_curso/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: Center(
        child: CustomScrollView(
            slivers: [
              _CustomAppBar(movie: movie),
              SliverList(
                  delegate: SliverChildListDelegate([
                _PosterAndTitle(movie: movie),
                _Overview(movie: movie),
                _Overview(movie: movie),
                _Overview(movie: movie),
                CastingCards(movieId: movie.id)
              ]))
            ],
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics())),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primaryColor,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            color: Colors.black12,
            padding: const EdgeInsets.all(10),
            child: Text(movie.title, style: const TextStyle(fontSize: 16)),
            alignment: Alignment.bottomCenter),
        background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterPath),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * 0.55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(movie.title,
                    maxFontSize: 22,
                    style: texTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                SelectableText(movie.originalTitle,
                    style: texTheme.subtitle1,
                    scrollPhysics: const ClampingScrollPhysics(),
                    maxLines: 1),
                Row(children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(movie.voteAverage.toString(), style: texTheme.caption)
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1, vertical: size.width * 0.05),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
