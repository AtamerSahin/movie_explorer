import 'package:movie_explorer/model/movie.dart';
import 'package:movie_explorer/model/movie_detail.dart';

abstract class MovieBase {
  Future<Movies> getMovies(String page, String query);
  Future<MovieDetail> getMovieDetail(String id);
}
