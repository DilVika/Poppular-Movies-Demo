import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:popular_movie/domain/use_cases/fetch_movies_use_case.dart';
import 'package:popular_movie/presentation/bloc/movies_event.dart';
import 'package:popular_movie/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  FetchMoviesUseCase _useCase;

  MoviesBloc(MoviesState initialState, FetchMoviesUseCase useCase)
      : _useCase = useCase,
        super(initialState);

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    try {
      final data = await _useCase.execute(null);
      yield MoviesFetchSuccessState(data);
    } on HttpException catch (ex) {
      yield MoviesFetchErrorState(ex.message);
    }
  }
}
