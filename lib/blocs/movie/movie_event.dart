part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieEvent extends MovieEvent {
  String query;
  FetchMovieEvent({required this.query});
}

class PaginationEvent extends MovieEvent {
  String query;
  PaginationEvent({required this.query});
}
