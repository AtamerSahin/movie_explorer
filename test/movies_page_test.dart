// Import the test package and Counter class

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/custom_widgets/movie_card.dart';
import 'package:movie_explorer/app/screens/movies_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          body: MovieCard(
            img: null,
            name: "a",
            point: "6",
          ),
        ),
      ),
    ));

    final nameFinder = find.text("a");
    final pointFinder = find.text('6');

    expect(nameFinder, findsOneWidget);
    expect(pointFinder, findsOneWidget);
  });
}
