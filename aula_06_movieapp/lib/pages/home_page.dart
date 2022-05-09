import 'package:aula_06_movieapp/controllers/movie_controller.dart';
import 'package:aula_06_movieapp/decorators/movies_cache_repository_decorator.dart';
import 'package:aula_06_movieapp/repositories/movies_repository_imp.dart';
import 'package:aula_06_movieapp/service/dio_service_imp.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/movies_model.dart';
import '../utils/apis.utils.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(
        MoviesCacheRepositoryDecorator(
        MoviesRepostoryImp(
          DioServiceImp()
          )
          )
          );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (__, movies, _) {
                    return Visibility(
                      visible: movies != null,

                      child: Column(
                        children: [
                          Text(
                            'Movies',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                           SizedBox(height: 20,),
                           TextField(
                             onChanged: _controller.onChanged,
                           )
                        ],
                      ),
                      
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.listMovies.length,
                            itemBuilder: (_, idx) {
                              final String? posterPath =
                                  movies.listMovies[idx].posterPath;
                              if (posterPath != null) {
                                // return Image.network(
                                //     API.REQUEST_IMG(posterPath));
                                return CustomListCardWidget(
                                  movie: movies.listMovies[idx],
                                );
                              }
                              return Container();
                            },
                            separatorBuilder: (_, __) => Divider(),
                          )
                        : Lottie.asset('assets/lottie.json');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
