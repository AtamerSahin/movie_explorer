// Import the test package and Counter class

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/app/screens/movies_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_explorer/blocs/movie/movie_bloc.dart';

void main() {
  MoviesPage _moviesPage;

  testWidgets('validate email inline error message',
      (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => MovieBloc(),
      child: MoviesPage(),
    ));

    // final emailErrorFinder = find.text('Email is Required');
    // final textFormField = find.byKey(const Key('field_key'));
    // final textFinder = find.text('Email is required');
    // final validationMessageFinder =
    //     find.descendant(of: textFormField, matching: textFinder);
    // expect(validationMessageFinder, findsOneWidget);
    final passwordTextFormField = find.descendant(
      of: find.byKey(const Key('field_key')),
      matching: find.byType(EditableText),
    );
    final input = tester.widget<EditableText>(passwordTextFormField);
    expect(input.obscureText, isTrue);
  });
}
