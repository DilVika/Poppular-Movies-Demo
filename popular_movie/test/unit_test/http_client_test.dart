import 'package:flutter_test/flutter_test.dart';
import 'package:popular_movie/data/http_client.dart';

void main() {
  test('Fetch movies', () async {
    final httpClient = HttpClientImpl();
    final res = await httpClient.fetchMovies();
    expect(res.movies, isNotEmpty);
  });
}
