import 'package:flutter/material.dart';
import 'package:shimmer_ai/shimmer_ai.dart'; // Import the main package

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShimmerDemoPage(),
      debugShowCheckedModeBanner: false, // For cleaner demo
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
      body: SingleChildScrollView(
        // Use SingleChildScrollView for better scrolling
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align content to start
          children: [
            const Text('Toggle Shimmer:'),
            Switch(
              value: isLoading,
              onChanged: (value) {
                setState(() {
                  isLoading = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Example 1: Text widget with default shimmer effect
            Text(
              'Hello Shimmer! (Default)',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ).withShimmerAi(loading: isLoading),

            const SizedBox(height: 20),

            // Example 2: CircleAvatar with custom shimmer colors and direction
            const Text('Custom Shimmer for Avatar:'),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 40,
              backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/14101776?v=4',
              ),
            ).withShimmerAi(
              loading: isLoading,
              baseColor: Colors.purple.shade100,
              highlightColor: Colors.purple.shade50,
              duration: const Duration(seconds: 2),
              direction: ShimmerDirection.btt, // Bottom to top
            ),

            const SizedBox(height: 30),

            // Example 3: Container with custom border radius and no repeat
            const Text('Container with Custom Radius & No Repeat:'),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Button',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ).withShimmerAi(
              loading: isLoading,
              borderRadius: 20, // More rounded corners
              repeat: false, // Only one shimmer cycle
              duration: const Duration(seconds: 1),
            ),

            const SizedBox(height: 30),

            // Example 4: Custom gradient shimmer
            const Text('Custom Gradient Shimmer:'),
            const SizedBox(height: 10),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Colors.teal, Colors.cyan],
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Gradient Shimmer',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ).withShimmerAi(
              loading: isLoading,
              customGradient: LinearGradient(
                colors: [
                  Colors.amber.shade200,
                  Colors.amber.shade50,
                  Colors.amber.shade200,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              duration: const Duration(milliseconds: 1800),
              angle: -0.5, // Tilted shimmer
            ),

            const SizedBox(height: 30),

            // Example 5: A more complex list item
            const Text('Complex List Item:'),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Name Here',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Short description or status update.',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).withShimmerAi(loading: isLoading),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
