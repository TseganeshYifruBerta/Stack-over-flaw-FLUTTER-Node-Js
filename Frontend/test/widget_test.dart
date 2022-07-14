// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:js';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//
import 'package:please/presentation/answer/add_answer_screen.dart';
import 'package:please/presentation/question/questions_screen.dart';

void main() {
  testWidgets('answer page widget test', (WidgetTester tester) async {
    final addfield = find.byWidget(TextFormField());
    final addbutton = find.byWidget(ElevatedButton(onPressed:(){} , child: Text("submit"),));

    await tester.pumpWidget(const AddAnswerScreen(questionId: "SE"));
    await tester.enterText(addfield, "we could enter an answer like this");
    await tester.tap(addbutton);
    await tester.pump();

    expect(addfield, findsNWidgets(2));
    expect(find.text("we could enter an answer like this"), findsWidgets);
  });
}

void mainn() {
  testWidgets("question page tester", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: QuestionScreen()));
    await tester.drag(find.byType(ListView), Offset(0, -100));
    await tester.pump();

    final ListTileFinder = find.byType(ListTile);
    expect(ListTileFinder, findsWidgets);
  });
}
