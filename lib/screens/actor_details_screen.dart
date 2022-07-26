import 'package:flutter/material.dart';
import 'package:peliculas_curso/models/models.dart';
import 'package:peliculas_curso/providers/providers.dart';
import 'package:peliculas_curso/widgets/filmography_cards.dart';
import 'package:provider/provider.dart';

class ActorDetailsScreen extends StatelessWidget {
  const ActorDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final actorId = ModalRoute.of(context)?.settings.arguments as int;
    final actorProvider = Provider.of<ActorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Actor')),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: actorProvider.getActorDetails(actorId),
          builder: (_, AsyncSnapshot<Actor> snapshot) {
            if (snapshot.hasData) {
              final actor = snapshot.data!;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInImage(
                          height: size.height * 0.3,
                          width: double.infinity,
                          placeholder: const AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(actor.fullProfilePath),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          actor.name!,
                          style: textTheme.headline5,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          actor.biography!,
                          textAlign: TextAlign.justify,
                          style: textTheme.subtitle1,
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  ),
                  FilmographyCards(actorId: actorId)
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
