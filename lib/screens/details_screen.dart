import 'package:flutter/material.dart';
import 'package:peliculas_curso/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movieName =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: Center(
        child: CustomScrollView(slivers: [_CustomAppBar()]),
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
        title: Container(
            width: double.infinity,
            child: const Text('movie.title'),
            alignment: Alignment.bottomCenter),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/loading.gif'),
            fit: BoxFit.cover),
      ),
    );
  }
}
