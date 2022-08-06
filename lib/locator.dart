import 'package:get_it/get_it.dart';
import 'package:movie_explorer/data/movies_client.dart';
import 'package:movie_explorer/network/dio_client.dart';
import 'package:movie_explorer/repository/movie_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => MoviesClient());
  locator.registerLazySingleton(() => MovieRepository());
}
