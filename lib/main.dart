import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/screens/homepage.dart';
import 'package:movie_explorer/app/screens/movies_page.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';
import 'package:movie_explorer/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/locator.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => MovieBloc(),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (BuildContext context) => MovieDetailBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: MoviesPage(),
      ),
    );
  }
}