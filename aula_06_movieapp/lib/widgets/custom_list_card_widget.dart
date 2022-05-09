import 'package:aula_06_movieapp/pages/details_page.dart';
import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  //construtor
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          Navigator.push(context, 
             MaterialPageRoute(builder: (_) => DetailsPage(movie: movie),
             fullscreenDialog: true, )
          );
        },
        
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero( //animacao de transicao, quando se clica no card
                  tag: movie.id as int,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress){
                      if(progress == null) return child;
                      return CircularProgressIndicator.adaptive();
                    } ,),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title.toString(),
                        style: Theme.of(context).textTheme.headline6, 
                        softWrap: true,   
                        overflow: TextOverflow.visible,
                      ),
                      Spacer(), 
                      Text('Popularidade ' + movie.popularity.toString()),
                      const SizedBox(height: 10,),
                      Text('Popularidade ' + movie.voteAverage.toString()),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
