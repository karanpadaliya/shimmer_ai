import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_ai/shimmer_ai.dart';
import 'package:shimmer_ai/src/widgets/shimmer_placeholders.dart';

void main() {
  group('shimmer_ai widget tests', () {
    testWidgets('withShimmerAi shows shimmer when loading is true',
        (WidgetTester tester) async {
      const testText = 'Loading Text';

      // Use withShimmerAi on a Text widget with loading=true
      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text(testText).withShimmerAi(loading: true),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      // Should find the shimmer placeholder and NOT the original Text widget
      expect(find.byType(ShimmerTextPlaceholder), findsOneWidget);
      expect(find.text(testText), findsNothing);
    });

    testWidgets('withShimmerAi shows original widget when loading is false',
        (WidgetTester tester) async {
      const testText = 'Actual Text';

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text(testText).withShimmerAi(loading: false),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      // Should find the original Text widget and NOT the shimmer placeholder
      expect(find.byType(ShimmerTextPlaceholder), findsNothing);
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('withShimmerAi handles complex widget tree',
        (WidgetTester tester) async {
      // A column containing a CircleAvatar, a Text, and a Container
      final complexWidget = MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              CircleAvatar().withShimmerAi(loading: true),
              Text('User Name').withShimmerAi(loading: true),
              Container(width: 100, height: 20, color: Colors.blue)
                  .withShimmerAi(loading: true),
            ],
          ),
        ),
      );

      await tester.pumpWidget(complexWidget);

      // Should find shimmer placeholders for the correct types
      expect(find.byType(ShimmerBoxPlaceholder),
          findsNWidgets(2)); // For CircleAvatar & Container
      expect(find.byType(ShimmerTextPlaceholder), findsOneWidget); // For Text

      // Should NOT find the original widgets
      expect(find.byType(Text), findsNothing);
      expect(find.byType(CircleAvatar), findsNothing);

      // Do not assert for Container, as placeholders may use Container internally
    });
  });
}
