import 'package:popular_movie/data/models/movies_list.dart';

abstract class MoviesState {}

class MoviesInitialState extends MoviesState {}

class MoviesFetchSuccessState extends MoviesState {
  final MoviesList list;

  MoviesFetchSuccessState(this.list);
}

class MoviesFetchErrorState extends MoviesState {
  final String msg;

  MoviesFetchErrorState(this.msg);
}
