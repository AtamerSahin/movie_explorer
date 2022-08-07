import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';
import 'package:movie_explorer/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/locator.dart';
import 'package:movie_explorer/route/routes.gr.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

//Autoroute
final _appRouter = AppRouter();

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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Material App',
      ),
    );
  }
}
