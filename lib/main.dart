import 'package:flutter/material.dart';
import 'package:peliculas_curso/screens/screens.dart';
import 'package:peliculas_curso/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
