part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  MovieInitial();
}

class MovieLoadingState extends MovieState {
  MovieLoadingState();
}

class MovieLoadedState extends MovieState {
  Movies? movies;
  bool? hasMore;
  List<Result> moviesList;

  MovieLoadedState({
    required this.movies,
    required this.hasMore,
    required this.moviesList,
  });
}

class MovieErrorState extends MovieState {}

class MoviePaginationState extends MovieState {
  Movies? movies;
  bool? hasMore;
  List<Result> moviesList;
  MoviePaginationState({
    required this.movies,
    required this.hasMore,
    required this.moviesList,
  });
}
