// test/shimmer_ai_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_ai/shimmer_ai.dart';
import 'package:shimmer_ai/src/widgets/shimmer_placeholders.dart';

void main() {
  group('shimmer_ai widget tests', () {
    testWidgets('withShimmerAi shows shimmer when loading is true',
        (WidgetTester tester) async {
      const testText = 'Loading Text';

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text(testText).withShimmerAi(loading: true),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(ShimmerTextPlaceholder), findsOneWidget);
      expect(find.byType(CustomShimmerEffect),
          findsOneWidget); // Changed to CustomShimmerEffect
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

      expect(find.byType(ShimmerTextPlaceholder), findsNothing);
      expect(find.byType(CustomShimmerEffect),
          findsNothing); // Changed to CustomShimmerEffect
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('withShimmerAi handles complex widget tree',
        (WidgetTester tester) async {
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

      expect(find.byType(ShimmerBoxPlaceholder), findsNWidgets(2));
      expect(find.byType(ShimmerTextPlaceholder), findsOneWidget);
      expect(find.byType(CustomShimmerEffect),
          findsNWidgets(3)); // Changed to CustomShimmerEffect
      expect(find.byType(Text), findsNothing);
      expect(find.byType(CircleAvatar), findsNothing);
    });

    testWidgets('withShimmerAi applies custom base and highlight colors',
        (WidgetTester tester) async {
      const customBaseColor = Colors.red;
      const customHighlightColor = Colors.yellow;

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text('Test').withShimmerAi(
            loading: true,
            baseColor: customBaseColor,
            highlightColor: customHighlightColor,
          ),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      final customShimmerEffectFinder =
          find.byType(CustomShimmerEffect); // Changed to CustomShimmerEffect
      expect(customShimmerEffectFinder, findsOneWidget);

      final customShimmerEffect = tester.widget<CustomShimmerEffect>(
          customShimmerEffectFinder); // Changed to CustomShimmerEffect
      expect(customShimmerEffect.baseColor, customBaseColor);
      expect(customShimmerEffect.highlightColor, customHighlightColor);
    });

    testWidgets('withShimmerAi applies custom duration and direction',
        (WidgetTester tester) async {
      const customDuration = Duration(seconds: 5);
      const customDirection = ShimmerDirection.rtl;

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text('Test').withShimmerAi(
            loading: true,
            duration: customDuration,
            direction: customDirection,
          ),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      final customShimmerEffectFinder =
          find.byType(CustomShimmerEffect); // Changed to CustomShimmerEffect
      expect(customShimmerEffectFinder, findsOneWidget);

      final customShimmerEffect = tester.widget<CustomShimmerEffect>(
          customShimmerEffectFinder); // Changed to CustomShimmerEffect
      expect(customShimmerEffect.duration, customDuration);
      expect(customShimmerEffect.direction, customDirection);
    });

    testWidgets('withShimmerAi applies custom angle and repeat',
        (WidgetTester tester) async {
      const customAngle = 0.5;
      const customRepeat = false;

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text('Test').withShimmerAi(
            loading: true,
            angle: customAngle,
            repeat: customRepeat,
          ),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      final customShimmerEffectFinder =
          find.byType(CustomShimmerEffect); // Changed to CustomShimmerEffect
      expect(customShimmerEffectFinder, findsOneWidget);

      final customShimmerEffect = tester.widget<CustomShimmerEffect>(
          customShimmerEffectFinder); // Changed to CustomShimmerEffect
      expect(customShimmerEffect.angle, customAngle);
      expect(customShimmerEffect.repeat, customRepeat);
    });

    testWidgets('withShimmerAi applies custom gradient',
        (WidgetTester tester) async {
      final customGradient = LinearGradient(
        colors: [Colors.blue, Colors.green],
      );

      final widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: Text('Test').withShimmerAi(
            loading: true,
            customGradient: customGradient,
          ),
        ),
      );

      await tester.pumpWidget(widgetUnderTest);

      final customShimmerEffectFinder =
          find.byType(CustomShimmerEffect); // Changed to CustomShimmerEffect
      expect(customShimmerEffectFinder, findsOneWidget);

      final customShimmerEffect = tester.widget<CustomShimmerEffect>(
          customShimmerEffectFinder); // Changed to CustomShimmerEffect
      expect(customShimmerEffect.customGradient, customGradient);
    });
  });
}
