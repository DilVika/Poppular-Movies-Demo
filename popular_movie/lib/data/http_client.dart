import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:popular_movie/data/models/movies_list.dart';

abstract class IHttpClient {
  Future<MoviesList> fetchMovies();
}

class HttpClientImpl implements IHttpClient {
  final _baseUrl = 'https://api.themoviedb.org/3';
  final _apiKey = '884e1251d026311aa93e48d7057cfcce';

  @override
  Future<MoviesList> fetchMovies() async {
    var url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body);
      return MoviesList.fromJson(jsonData);
    } else {
      throw HttpException(res.body);
    }
  }
}
