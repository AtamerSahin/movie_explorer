import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/custom_widgets/movie_card.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';
import 'package:movie_explorer/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:provider/provider.dart';

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
          return Center(child: CircularProgressIndicator());
        }
        if (state is MovieDetailLoaded) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(state.movieDetail.title!),
              ),
              body: Container());
        }
        return Container();
      },
    );
  }
}
