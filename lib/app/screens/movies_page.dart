import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/screens/movie_detail.dart';
import 'package:movie_explorer/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_explorer/app/custom_widgets/movie_card.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../routes.gr.dart';

class MoviesPage extends StatefulWidget {
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = new ScrollController();

  bool _isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_addListenerToScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Autoroute

    final _movieBloc = BlocProvider.of<MovieBloc>(context);
    final _movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Movie Explorer"),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Search Movie",
                    border: InputBorder.none),
                controller: _textController,
                onChanged: (s) {
                  _movieBloc.add(FetchMovieEvent(query: s));
                },
              ),
            ),
            BlocBuilder<MovieBloc, MovieState>(
              bloc: _movieBloc,
              builder: (context, state) {
                if (state is MovieInitial) {
                  return Center(child: Text("Initial"));
                }
                if (state is MovieLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is MovieLoadedState) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 30,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10),
                          controller: _scrollController,
                          itemCount: state.hasMore == true
                              ? state.moviesList.length + 1
                              : state.moviesList.length,
                          itemBuilder: (context, index) {
                            if (state.hasMore == true &&
                                state.moviesList.length == index) {
                              return _newMoviesLoadingIndicator();
                            } else {
                              return InkWell(
                                onTap: () {
                                  _movieDetailBloc.add(FetchMovieDetailEvent(
                                      id: state.moviesList[index].id
                                          .toString()));

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             MovieDetailPage()));
                                  context.router
                                      .pushNamed('/movie-detail-page');
                                },
                                child: MovieCard(
                                    height: 0.09,
                                    name: state.moviesList[index].originalTitle,
                                    point: state.moviesList[index].voteAverage
                                        .toString(),
                                    img: state.moviesList[index].posterPath),
                              );
                            }
                          }),
                    ),
                  );
                }
                if (state is MoviePaginationState) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 30,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10),
                          controller: _scrollController,
                          itemCount: state.hasMore == true
                              ? state.moviesList.length + 1
                              : state.moviesList.length,
                          itemBuilder: (context, index) {
                            if (state.hasMore == true &&
                                state.moviesList.length == index) {
                              return _newMoviesLoadingIndicator();
                            } else {
                              return InkWell(
                                onTap: () {
                                  _movieDetailBloc.add(FetchMovieDetailEvent(
                                      id: state.moviesList[index].id
                                          .toString()));
                                  context.router
                                      .pushNamed('/movie-detail-page');
                                },
                                child: MovieCard(
                                    height: 0.09,
                                    name: state.moviesList[index].originalTitle,
                                    point: state.moviesList[index].voteAverage
                                        .toString(),
                                    img: state.moviesList[index].posterPath),
                              );
                            }
                          }),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ));
  }

  void _addListenerToScroll() {
    final _movieBloc = BlocProvider.of<MovieBloc>(context);
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _movieBloc.add(PaginationEvent(query: _textController.text));
    }
  }

  // void getMovieswithPagination() async {
  //   final _moviesViewModel =
  //       Provider.of<MoviesViewModel>(context, listen: false);
  //   if (_isLoading == false) {
  //     _isLoading = true;
  //     await _moviesViewModel.getMoviesWithPagination();
  //     _isLoading = false;
  //   }
  // }

  _newMoviesLoadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
