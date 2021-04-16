

import 'package:popular_movie/data/http_client.dart';
import 'package:popular_movie/data/models/movies_list.dart';
import 'package:popular_movie/domain/repository/IMovieRepository.dart';

class MoviesRepository implements IMovieRepository {
  IHttpClient _client;

  MoviesRepository(IHttpClient client) : _client = client;

  @override
  Future<MoviesList> getMoviesList() {
    return _client.fetchMovies();
  }
}
