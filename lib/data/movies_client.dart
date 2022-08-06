import 'package:movie_explorer/data/movie_base.dart';
import 'package:movie_explorer/locator.dart';
import 'package:movie_explorer/model/movie.dart';
import 'package:movie_explorer/model/movie_detail.dart';
import 'package:movie_explorer/network/dio_client.dart';

class MoviesClient implements MovieBase {
  DioClient _dioClient = locator<DioClient>();
  final String apiKey = "9c9d940ea866d1f2c21d69366215ee7d";

  //Get Movies
  @override
  Future<Movies> getMovies(String page, String query) async {
    try {
      var result = await _dioClient.dio.get("/search/movie?api_key=" +
          apiKey +
          "&query=" +
          query +
          "&page=" +
          page);

      print(result.data.toString());
      var data = Movies.fromMap(result.data);
      return data;
    } catch (e) {
      throw e;
    }
  }

  //Get Movie Detail
  @override
  Future<MovieDetail> getMovieDetail(String id) async {
    // try {
    //   var result =
    //       await _dioClient.dio.get("/movie/" + id + "?api_key=" + apiKey);

    //   print(result.data.toString());
    //   var data = MovieDetail.fromMap(result.data);
    //   return data;
    // } catch (e) {
    //   throw e;
    // }
    return MovieDetail();
  }
}
