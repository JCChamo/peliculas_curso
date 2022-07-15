import 'package:flutter/material.dart';
import 'package:peliculas_curso/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: const <Widget>[CardSwiper(), MovieSlider()]),
        ));
  }
}
