import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_ai/shimmer_ai.dart';

void main() {
  testWidgets('renders shimmer when loading is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Loading Text').withShimmerAi(loading: true),
        ),
      ),
    );

    expect(find.byType(ShimmerWrapper), findsOneWidget);
  });

  testWidgets('renders original widget when loading is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Loaded!').withShimmerAi(loading: false),
        ),
      ),
    );

    expect(find.text('Loaded!'), findsOneWidget);
    expect(find.byType(ShimmerWrapper), findsNothing);
  });
}
