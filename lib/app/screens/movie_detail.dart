import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/blocs/movie_detail/movie_detail_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final _movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);

    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      bloc: _movieDetailBloc,
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is MovieDetailLoaded) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: Text(state.movieDetail.title!),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: deviceHeight * 0.35,
                          width: deviceWidth * 0.55,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  state.movieDetail.posterPath!,
                            ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.movieDetail.originalTitle!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            state.movieDetail.releaseDate!.year.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.movieDetail.overview!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.movieDetail.status.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Rating: " +
                            state.movieDetail.voteAverage.toString()),
                      ),
                    ],
                  ),
                ),
              ));
        }
        return Container();
      },
    );
  }
}
