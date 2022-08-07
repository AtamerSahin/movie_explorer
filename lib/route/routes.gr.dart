// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:movie_explorer/app/screens/movie_detail.dart' as _i2;
import 'package:movie_explorer/app/screens/movies_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MoviesRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.MoviesPage());
    },
    MovieDetailRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.MovieDetailPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MoviesRoute.name, path: '/'),
        _i3.RouteConfig(MovieDetailRoute.name, path: '/movie-detail-page')
      ];
}

/// generated route for
/// [_i1.MoviesPage]
class MoviesRoute extends _i3.PageRouteInfo<void> {
  const MoviesRoute() : super(MoviesRoute.name, path: '/');

  static const String name = 'MoviesRoute';
}

/// generated route for
/// [_i2.MovieDetailPage]
class MovieDetailRoute extends _i3.PageRouteInfo<void> {
  const MovieDetailRoute()
      : super(MovieDetailRoute.name, path: '/movie-detail-page');

  static const String name = 'MovieDetailRoute';
}
