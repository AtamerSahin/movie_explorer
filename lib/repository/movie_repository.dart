import 'package:movie_explorer/data/movie_base.dart';
import 'package:movie_explorer/data/movies_client.dart';
import 'package:movie_explorer/locator.dart';
import 'package:movie_explorer/model/movie.dart';
import 'package:movie_explorer/model/movie_detail.dart';

class MovieRepository implements MovieBase {
  final _movieClient = locator<MoviesClient>();

  @override
  Future<Movies> getMovies(String page, String query) async {
    return _movieClient.getMovies(page, query);
  }

  @override
  Future<MovieDetail> getMovieDetail(String id) {
    return _movieClient.getMovieDetail(id);
  }
}
