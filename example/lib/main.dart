import 'package:flutter/material.dart';
import 'package:shimmer_ai/shimmer_ai.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ShimmerAIExamples(),
));

class ShimmerAIExamples extends StatefulWidget {
  const ShimmerAIExamples({super.key});

  @override
  State<ShimmerAIExamples> createState() => _ShimmerAIExamplesState();
}

class _ShimmerAIExamplesState extends State<ShimmerAIExamples> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shimmer_ai — New Layout Controls'),
        actions: [
          Row(
            children: [
              const Text('Loading'),
              Switch(
                value: loading,
                onChanged: (v) => setState(() => loading = v),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Text'),
          // Single line
          Text(' ')
              .withShimmerAi(
            loading: loading,
            width: 160,
            height: 16,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          // Second line, different width
          Text(' ')
              .withShimmerAi(
            loading: loading,
            width: 220,
            height: 12,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          _sectionTitle('Image'),
          // Image placeholder with fixed box and rounded corners
          Image.network('https://picsum.photos/seed/ai/600/400', fit: BoxFit.cover)
              .withShimmerAi(
            loading: loading,
            width: 280,
            height: 160,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          _sectionTitle('CircleAvatar'),
          // Pure circular skeleton using decoration
          const SizedBox.shrink()
              .withShimmerAi(
            loading: loading,
            width: 64,
            height: 64,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(shape: BoxShape.circle),
          ),

          _sectionTitle('ElevatedButton'),
          // Button-sized placeholder
          ElevatedButton(
            onPressed: () {},
            child: const Text('Continue'),
          ).withShimmerAi(
            loading: loading,
            width: 200,
            height: 48,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          _sectionTitle('Card'),
          // Card block with inner padding and outer margin
          Card(
            child: SizedBox(
              width: double.infinity,
              height: 120,
              child: Center(
                child: Text(
                  loading ? ' ' : 'Loaded Card Content',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ).withShimmerAi(
            loading: loading,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          _sectionTitle('ListTile — Whole Tile Placeholder'),
          // Whole tile as a single rounded rectangle placeholder
          ListTile(
            leading: const CircleAvatar(radius: 24),
            title: Text(loading ? ' ' : 'Title'),
            subtitle: Text(loading ? ' ' : 'Subtitle'),
            trailing: const Icon(Icons.chevron_right),
          ).withShimmerAi(
            loading: loading,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          _sectionTitle('ListTile — Inline Line Placeholders'),
          // Title & subtitle each sized using width/height; avatar circular via decoration
          Row(
            children: [
              const SizedBox.shrink().withShimmerAi(
                loading: loading,
                width: 48,
                height: 48,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                margin: const EdgeInsets.only(right: 12),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' ')
                        .withShimmerAi(
                      loading: loading,
                      width: 180,
                      height: 14,
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Text(' ')
                        .withShimmerAi(
                      loading: loading,
                      width: 240,
                      height: 12,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          )
              .withShimmerAi(
            loading: false, // keep parent normal; shimmer is on the lines above
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),

          _sectionTitle('Icon'),
          // Icon sized and centered inside a circular shimmer box
          const Icon(Icons.star, size: 28)
              .withShimmerAi(
            loading: loading,
            width: 44,
            height: 44,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(shape: BoxShape.circle),
          ),

          _sectionTitle('Grid — Card Thumbnails'),
          // Grid items use decoration for rounded corners; grid gives width/height
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (_, i) {
              return const SizedBox.shrink().withShimmerAi(
                loading: loading,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
