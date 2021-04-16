import 'package:popular_movie/data/models/movie.dart';

class MoviesList {
  final int _page;
  final List<Movie> _movies;
  final int _totalPages;
  final int _totalResults;

  factory MoviesList.fromJson(Map<String, dynamic> json) {
    List<Movie> movies = [];
    json['results'].forEach((movieJson) {
      movies.add(Movie.fromJson(movieJson));
    });

    return MoviesList(
        page: json['page'],
        movies: movies,
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }

  MoviesList({required int page, required List<Movie> movies, required int totalPages, required int totalResults}) // ? require
      : _page = page,
        _movies = movies,
        _totalPages = totalPages,
        _totalResults = totalResults;

  int get page => _page;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  List<Movie> get movies => _movies;
}
