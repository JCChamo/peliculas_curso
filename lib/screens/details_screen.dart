import 'package:flutter/material.dart';
import 'package:peliculas_curso/theme/app_theme.dart';
import 'package:peliculas_curso/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movieName =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: Center(
        child: CustomScrollView(
            slivers: [
              _CustomAppBar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                const _PosterAndTitle(),
                const _Overview(),
                const _Overview(),
                const _Overview(),
                CastingCards()
              ]))
            ],
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics())),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
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
            child: const Text('movie.title', style: TextStyle(fontSize: 16)),
            alignment: Alignment.bottomCenter),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie-title',
                  style: texTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text('movie-originalTitle',
                  style: texTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              Row(children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                const SizedBox(width: 5),
                Text('movie.voteAverage', style: texTheme.caption)
              ])
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1, vertical: size.width * 0.05),
      child: Text(
        'Minim Lorem amet minim incididunt pariatur minim Lorem tempor est ex. Aliquip magna magna sint consequat fugiat duis. Cupidatat voluptate ullamco excepteur mollit esse irure. Reprehenderit dolore nostrud officia exercitation dolor.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
