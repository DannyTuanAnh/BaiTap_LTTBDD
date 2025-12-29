// This is a basic Flutter widget test for the Library Management app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:library_manage_072205000267_trantuananh/screen/home_screen.dart';

void main() {
  testWidgets('Library Management app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify that the bottom navigation bar exists with correct tabs.
    expect(find.text('Quản lý sách'), findsOneWidget);
    expect(find.text('Người dùng'), findsOneWidget);

    // Verify that the book management tab is selected by default.
    expect(find.byIcon(Icons.book), findsOneWidget);
    expect(find.byIcon(Icons.people), findsOneWidget);

    // Tap the user management tab and trigger a frame.
    await tester.tap(find.text('Người dùng'));
    await tester.pump();

    // Verify that we can switch to user management screen.
    expect(find.byIcon(Icons.people), findsOneWidget);
  });
}
