import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/blocs/movie/bloc/movie_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/custom_widgets/movie_card.dart';
import 'package:movie_explorer/blocs/movie/bloc/movie_bloc.dart';

class MoviesPage extends StatefulWidget {
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  var _textController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_addListenerToScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _movieBloc = BlocProvider.of<MovieBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Movies"),
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          bloc: _movieBloc,
          builder: (context, state) {
            if (state is MovieInitial) {
              return Center(
                child: Container(
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
                    controller: state.textEditingController,
                    onChanged: (s) async {
                      if (s.length >= 4) _movieBloc.add(FetchMovieEvent());
                    },
                  ),
                ),
              );
            }
            if (state is MovieLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MovieLoadedState) {
              return Column(
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
                      controller: state.textEditingController,
                      onChanged: (s) async {
                        if (s.length >= 4) _movieBloc.add(FetchMovieEvent());
                      },
                    ),
                  ),
                  Expanded(
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
                                onTap: () {},
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
                  ),
                ],
              );
            }
            if (state is MoviePaginationState) {
              return Column(
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
                      controller: state.textEditingController,
                      onChanged: (s) async {
                        if (s.length >= 4) _movieBloc.add(FetchMovieEvent());
                      },
                    ),
                  ),
                  Expanded(
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
                                onTap: () {},
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
                  ),
                ],
              );
            }
            return Container();
          },
        ));
  }

  void _addListenerToScroll() {
    final _movieBloc = BlocProvider.of<MovieBloc>(context);
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _movieBloc.add(PaginationEvent());
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
