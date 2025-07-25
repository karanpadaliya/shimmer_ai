import 'package:flutter/material.dart';
import 'package:shimmer_ai/shimmer_ai.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShimmerDemoPage(),
    );
  }
}

/// A simple StatefulWidget that toggles
/// shimmer loading effect on/off.
class ShimmerDemoPage extends StatefulWidget {
  const ShimmerDemoPage({super.key});

  @override
  State<ShimmerDemoPage> createState() => _ShimmerDemoPageState();
}

class _ShimmerDemoPageState extends State<ShimmerDemoPage> {
  // Controls whether the shimmer is shown or the real content
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shimmer_ai demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Example 1: Text widget with shimmer effect
            Text(
              'Hello Shimmer!',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ).withShimmerAi(loading: isLoading),

            const SizedBox(height: 30),

            // Example 2: CircleAvatar with shimmer
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/14101776?v=4',
              ),
            ).withShimmerAi(loading: isLoading),

            const SizedBox(height: 30),

            // Example 3: Colored Container with shimmer
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                'Button',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ).withShimmerAi(loading: isLoading),

            const SizedBox(height: 50),

            // Toggle button to switch loading state
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
              },
              child: Text(isLoading ? 'Show Content' : 'Show Shimmer'),
            ),
          ],
        ),
      ),
    );
  }
}
