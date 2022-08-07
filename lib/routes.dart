import 'package:auto_route/auto_route.dart';
import 'package:movie_explorer/app/screens/movie_detail.dart';
import 'package:movie_explorer/app/screens/movies_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MoviesPage, initial: true),
    AutoRoute(page: MovieDetailPage),
  ],
)
class $AppRouter {}
