

import 'package:popular_movie/data/models/movies_list.dart';
import 'package:popular_movie/domain/repository/IMovieRepository.dart';
import 'package:popular_movie/domain/use_cases/IUseCase.dart';

class FetchMoviesUseCase implements IUseCase<Null, MoviesList> {
  IMovieRepository _repository;

  FetchMoviesUseCase(IMovieRepository repository) : _repository = repository;

  @override
  Future<MoviesList> execute(_) {
    return _repository.getMoviesList();
  }
}
