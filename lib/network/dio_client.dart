import 'package:dio/dio.dart';

class DioClient {
  Dio dio = new Dio(); // with default Options

  DioClient() {
    setupDio();
  }

  setupDio() async {
    dio.options.baseUrl = "https://api.themoviedb.org/3";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
  }
}
