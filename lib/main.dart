import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/homepage.dart';
import 'package:movie_explorer/app/movies_page.dart';
import 'package:movie_explorer/blocs/movie/bloc/movie_bloc.dart';
import 'package:movie_explorer/locator.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => MovieBloc(),
        child: MoviesPage(),
      ),
    );
  }
}
