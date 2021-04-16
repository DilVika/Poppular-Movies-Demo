import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movie/data/models/movie.dart';
import 'package:popular_movie/presentation/Widgets/atoms/horizontal_card.dart';
import 'package:popular_movie/presentation/Widgets/pages/detail_page.dart';
import 'package:popular_movie/presentation/bloc/movies_bloc.dart';
import 'package:popular_movie/presentation/bloc/movies_event.dart';
import 'package:popular_movie/presentation/bloc/movies_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = "Popular Movies Demo";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<MoviesBloc>();
    bloc.add(FetchMovieEvent());
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Movies",
                    style: theme.textTheme.headline6,
                  ),
                ],
              ),
              Flexible(
                flex: 3,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                    bloc: bloc,
                    builder: (_, moviesState) {
                      List<Movie> list = [];
                      if (moviesState is MoviesFetchSuccessState) {
                        list = moviesState.list.movies;
                      }
                      if (moviesState is MoviesFetchErrorState) {
                        return Text(moviesState.msg);
                      }
                      if (moviesState is MoviesInitialState) {
                        return CircularProgressIndicator();
                      }

                      return OrientationBuilder(
                        builder: (context, orientation) {
                          if (orientation == Orientation.landscape) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(top: 10),
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HorizontalCard(
                                  title: list[index].title,
                                  imgSource: list[index].image ??
                                      'https://via.placeholder.com/200x150',
                                  lang: list[index].language,
                                  releaseDate: list[index].releaseDate,
                                  rate: list[index].voteAverage,
                                  countRates: list[index].voteCount ?? 0,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(list[index])));
                                  },
                                );
                              },
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(top: 10),
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Image.network(list[index].image!),
                                  title: Text(list[index].title),
                                  subtitle: Text(
                                    list[index].overview,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(list[index])));
                                  },
                                );
                              },
                            );
                          }
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
