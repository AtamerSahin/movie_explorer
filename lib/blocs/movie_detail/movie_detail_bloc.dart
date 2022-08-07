import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_explorer/model/movie_detail.dart';
import 'package:movie_explorer/repository/movie_repository.dart';

import '../../locator.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final _movieRepository = locator<MovieRepository>();
  MovieDetail? movieDetail;
  MovieDetailBloc() : super(MovieDetailLoading()) {
    on<FetchMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      movieDetail = await _movieRepository.getMovieDetail(event.id);
      emit(MovieDetailLoaded(movieDetail: movieDetail!));
    });
  }
}
