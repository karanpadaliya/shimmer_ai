import 'package:flutter/material.dart';
import 'package:shimmer_ai/shimmer_ai.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const isLoading = true;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shimmer Ai Example')),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Hello Shimmer!',
              style: const TextStyle(fontSize: 24),
            ).withShimmerAi(loading: isLoading),
          ),
        ),
      ),
    );
  }
}
