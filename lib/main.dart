import 'package:flutter/material.dart';
import 'package:peliculas_curso/providers/providers.dart';
import 'package:peliculas_curso/screens/screens.dart';
import 'package:peliculas_curso/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'film-details': (_) => FilmDetailsScreen(),
        'actor-details': (_) => ActorDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
