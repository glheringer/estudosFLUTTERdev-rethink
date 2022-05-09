import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({ Key? key, required this.movie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(movie.title.toString()),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              width: MediaQuery.of(context).size.width,
              child: Hero( //adicionar o hero tambem aqui, e o id tem que ser o mesmo
                tag: movie.id as int ,
                child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress){
                      if(progress == null) return child;
                      return CircularProgressIndicator.adaptive();
                    }
                ),
              )
            ),
            const SizedBox(height: 20,),
            Text(movie.overview.toString(),
            style: Theme.of(context).textTheme.subtitle1,),
            Text(movie.overview.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.title),
                Text(movie.originalTitle.toString()),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.new_releases),
                Text(movie.releaseDate.toString()),
              ],
            ),
          ]),
        ),
    ) ,
    );
  }
}