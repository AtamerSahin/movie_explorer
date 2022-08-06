import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/custom_widgets/movie_card.dart';
import 'package:movie_explorer/blocs/movie/bloc/movie_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _movieBloc = BlocProvider.of<MovieBloc>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<MovieBloc, MovieState>(
            bloc: _movieBloc,
            builder: (context, state) {
              if (state is MovieInitial) {
                return Center(
                  child: Text("Initial State"),
                );
              }
              if (state is MovieLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MovieLoadedState) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 10),
                    shrinkWrap: true,
                    itemCount: state.movies!.results!.length,
                    itemBuilder: ((context, index) => MovieCard(
                        height: 0.09,
                        name: state.movies!.results![index].originalTitle,
                        point: state.movies!.results![index].voteAverage
                            .toString(),
                        img: state.movies!.results![index].posterPath)));
              }
              if (state is MovieErrorState) {
                return Center(
                  child: Text("dasd"),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
