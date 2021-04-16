import 'package:popular_movie/data/models/movies_list.dart';

abstract class IMovieRepository {
  Future<MoviesList> getMoviesList();
}
