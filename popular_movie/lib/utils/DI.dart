
import 'package:get_it/get_it.dart';
import 'package:popular_movie/data/http_client.dart';
import 'package:popular_movie/data/repository/MovieRepository.dart';
import 'package:popular_movie/domain/repository/IMovieRepository.dart';

class DI {
  static GetIt getIt = GetIt.instance;

  static void initDi() {
    getIt.registerSingleton<IHttpClient>(HttpClientImpl());
    getIt.registerSingleton<IMovieRepository>(
        MoviesRepository(getIt.get<IHttpClient>()));
  }
}
