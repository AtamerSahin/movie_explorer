part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  TextEditingController textEditingController = TextEditingController();
  MovieInitial({required this.textEditingController});
}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  Movies? movies;
  bool? hasMore;
  List<Result> moviesList;
  TextEditingController textEditingController;
  MovieLoadedState(
      {required this.movies,
      required this.hasMore,
      required this.moviesList,
      required this.textEditingController});
}

class MovieErrorState extends MovieState {}

class MoviePaginationState extends MovieState {
  Movies? movies;
  bool? hasMore;
  List<Result> moviesList;
  TextEditingController textEditingController;
  MoviePaginationState(
      {required this.movies,
      required this.hasMore,
      required this.moviesList,
      required this.textEditingController});
}
