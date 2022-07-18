import 'package:flutter/material.dart';
import 'package:peliculas_curso/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movieName =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [_CustomAppBar()],
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())
        ),
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
