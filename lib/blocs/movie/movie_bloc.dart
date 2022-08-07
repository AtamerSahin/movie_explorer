import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/locator.dart';
import 'package:movie_explorer/repository/movie_repository.dart';
import '../../../model/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final _movieRepository = locator<MovieRepository>();
  int page = 0;
  bool hasMore = false;
  List<Result> moviesList = [];
  Movies? movies;

  MovieBloc() : super(MovieInitial()) {
    // ignore: void_checks
    on<FetchMovieEvent>((event, emit) async {
      emit(MovieLoadingState());
      log(page.toString() + " PAGE FIRST FETCH");
      moviesList = [];
      hasMore = false;
      page = 0;
      page++;
      if (event.query.length >= 3) {
        movies = await _movieRepository.getMovies(page.toString(), event.query);
        moviesList.addAll(movies!.results!);

        if (movies!.totalPages! > page) {
          hasMore = true;
        } else {
          hasMore = false;
        }
      }
      emit(MovieLoadedState(
        movies: movies,
        hasMore: hasMore,
        moviesList: moviesList,
      ));
    });

    on<PaginationEvent>((event, emit) async {
      emit(MovieLoadedState(
        movies: movies,
        hasMore: hasMore,
        moviesList: moviesList,
      ));
      log(page.toString() + "PAGE FIRST FETCH");
      page++;
      if (event.query.length >= 3) {
        movies = await _movieRepository.getMovies(page.toString(), event.query);
        moviesList.addAll(movies!.results!);

        if (movies!.totalPages! > page) {
          hasMore = true;
        } else {
          hasMore = false;
        }
      }

      emit(MoviePaginationState(
        movies: movies,
        hasMore: hasMore,
        moviesList: moviesList,
      ));
    });
  }
}
