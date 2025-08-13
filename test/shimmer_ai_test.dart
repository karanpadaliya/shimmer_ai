// test/shimmer_ai_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_ai/shimmer_ai.dart';
import 'package:shimmer_ai/src/widgets/shimmer_placeholders.dart';

// The internal shimmer effect widget, not exported, but needed for testing
class CustomShimmerEffect extends StatelessWidget {
  final ShimmerAiConfig config;
  final Widget child;

  const CustomShimmerEffect(
      {super.key, required this.config, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder for the actual Shimmer widget
  }
}

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
          expect(find.byType(CustomShimmerEffect), findsNothing);
          expect(find.text(testText), findsOneWidget);
        });

    testWidgets('withShimmerAi handles complex widget tree',
            (WidgetTester tester) async {
          final complexWidget = MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const CircleAvatar().withShimmerAi(loading: true),
                  const Text('User Name').withShimmerAi(loading: true),
                  Container(width: 100, height: 20, color: Colors.blue)
                      .withShimmerAi(loading: true),
                ],
              ),
            ),
          );

          await tester.pumpWidget(complexWidget);

          expect(find.byType(ShimmerBoxPlaceholder), findsNWidgets(2));
          expect(find.byType(ShimmerTextPlaceholder), findsOneWidget);
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

          final shimmerPlaceholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(shimmerPlaceholderFinder, findsOneWidget);

          final shimmerPlaceholder = tester.widget<ShimmerTextPlaceholder>(shimmerPlaceholderFinder);
          expect(shimmerPlaceholder.config.baseColor, customBaseColor);
          expect(shimmerPlaceholder.config.highlightColor, customHighlightColor);
        });

    testWidgets('withShimmerAi applies custom duration and direction',
            (WidgetTester tester) async {
          const customDuration = Duration(milliseconds: 500);
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

          final shimmerPlaceholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(shimmerPlaceholderFinder, findsOneWidget);

          final shimmerPlaceholder = tester.widget<ShimmerTextPlaceholder>(shimmerPlaceholderFinder);
          expect(shimmerPlaceholder.config.duration, customDuration);
          expect(shimmerPlaceholder.config.direction, customDirection);
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

          final shimmerPlaceholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(shimmerPlaceholderFinder, findsOneWidget);

          final shimmerPlaceholder = tester.widget<ShimmerTextPlaceholder>(shimmerPlaceholderFinder);
          expect(shimmerPlaceholder.config.angle, customAngle);
          expect(shimmerPlaceholder.config.repeat, customRepeat);
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

          final shimmerPlaceholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(shimmerPlaceholderFinder, findsOneWidget);

          final shimmerPlaceholder = tester.widget<ShimmerTextPlaceholder>(shimmerPlaceholderFinder);
          expect(shimmerPlaceholder.config.customGradient, customGradient);
        });

    // New tests for UI customization parameters
    testWidgets('withShimmerAi applies custom width and height',
            (WidgetTester tester) async {
          const customWidth = 200.0;
          const customHeight = 50.0;

          final widgetUnderTest = MaterialApp(
            home: Scaffold(
              body: Text('Test').withShimmerAi(
                loading: true,
                width: customWidth,
                height: customHeight,
              ),
            ),
          );

          await tester.pumpWidget(widgetUnderTest);

          final placeholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(placeholderFinder, findsOneWidget);
          final placeholder = tester.widget<ShimmerTextPlaceholder>(placeholderFinder);

          final containerFinder = find.byType(Container);
          expect(containerFinder, findsOneWidget);
          final container = tester.widget<Container>(containerFinder);

          // We expect the placeholder to have a container with the specified dimensions.
          // We must check the constraints, not the non-existent 'width'/'height' getters.
          expect(container.constraints?.maxWidth, customWidth);
          expect(container.constraints?.maxHeight, customHeight);
        });

    testWidgets('withShimmerAi applies custom margin and padding',
            (WidgetTester tester) async {
          const customMargin = EdgeInsets.all(10);
          const customPadding = EdgeInsets.symmetric(horizontal: 5);

          final widgetUnderTest = MaterialApp(
            home: Scaffold(
              body: Text('Test').withShimmerAi(
                loading: true,
                margin: customMargin,
                padding: customPadding,
              ),
            ),
          );

          await tester.pumpWidget(widgetUnderTest);

          final placeholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(placeholderFinder, findsOneWidget);
          final placeholder = tester.widget<ShimmerTextPlaceholder>(placeholderFinder);

          final containerFinder = find.byType(Container);
          expect(containerFinder, findsOneWidget);
          final container = tester.widget<Container>(containerFinder);

          // We expect the placeholder's container to have the specified margin and padding.
          expect(container.margin, customMargin);
          expect(container.padding, customPadding);
        });

    testWidgets('withShimmerAi applies custom decoration',
            (WidgetTester tester) async {
          final customDecoration = BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          );

          final widgetUnderTest = MaterialApp(
            home: Scaffold(
              body: Text('Test').withShimmerAi(
                loading: true,
                decoration: customDecoration,
              ),
            ),
          );

          await tester.pumpWidget(widgetUnderTest);

          final placeholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(placeholderFinder, findsOneWidget);
          final placeholder = tester.widget<ShimmerTextPlaceholder>(placeholderFinder);

          final containerFinder = find.byType(Container);
          expect(containerFinder, findsOneWidget);
          final container = tester.widget<Container>(containerFinder);

          // We expect the placeholder's container to have the specified decoration.
          expect(container.decoration, customDecoration);
        });

    testWidgets('withShimmerAi applies custom borderRadius',
            (WidgetTester tester) async {
          const customBorderRadius = 25.0;

          final widgetUnderTest = MaterialApp(
            home: Scaffold(
              body: Text('Test').withShimmerAi(
                loading: true,
                borderRadius: customBorderRadius,
              ),
            ),
          );

          await tester.pumpWidget(widgetUnderTest);

          final placeholderFinder = find.byType(ShimmerTextPlaceholder);
          expect(placeholderFinder, findsOneWidget);
          final placeholder = tester.widget<ShimmerTextPlaceholder>(placeholderFinder);

          final containerFinder = find.byType(Container);
          expect(containerFinder, findsOneWidget);
          final container = tester.widget<Container>(containerFinder);

          final decoration = container.decoration as BoxDecoration;
          expect(decoration.borderRadius, BorderRadius.circular(customBorderRadius));
        });
  });
}
