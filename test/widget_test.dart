// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:advanced_calculator/screens/calculator_screen.dart';
import 'package:advanced_calculator/providers/calculator_provider.dart';
import 'package:advanced_calculator/providers/theme_provider.dart';
import 'package:advanced_calculator/providers/history_provider.dart';
import 'package:advanced_calculator/services/storage_service.dart';

void main() {
  testWidgets('Calculator basic functionality test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => CalculatorProvider()),
          ChangeNotifierProvider(
            create: (_) => HistoryProvider(StorageService()),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Advanced Calculator',
              theme: themeProvider.getTheme(context),
              home: const CalculatorScreen(),
            );
          },
        ),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify that the display shows '0' or empty initially
    expect(find.text('0'), findsOneWidget);

    // Tap the '1' button
    await tester.tap(find.text('1'));
    await tester.pump();

    // Verify that the display shows '1'
    expect(find.text('1'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.text('+'));
    await tester.pump();

    // Tap the '2' button
    await tester.tap(find.text('2'));
    await tester.pump();

    // Tap the '=' button
    await tester.tap(find.text('='));
    await tester.pump();

    // Verify that the result is '3.0'
    expect(find.text('3.0'), findsOneWidget);
  });
}
