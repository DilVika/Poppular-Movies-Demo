import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movie/domain/repository/IMovieRepository.dart';
import 'package:popular_movie/domain/use_cases/fetch_movies_use_case.dart';
import 'package:popular_movie/presentation/Widgets/pages/home_page.dart';
import 'package:popular_movie/presentation/bloc/movies_bloc.dart';
import 'package:popular_movie/presentation/bloc/movies_state.dart';
import 'package:popular_movie/utils/DI.dart';

void main() {
  DI.initDi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MoviesBloc(MoviesInitialState(),
            FetchMoviesUseCase(DI.getIt.get<IMovieRepository>())),
        child: MaterialApp(
          home: HomePage(),
        ));
  }
}
