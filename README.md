<!DOCTYPE html>
<html lang="en">
<body>

<h1>✨ shimmer_ai – Effortless Flutter Shimmer</h1>

<p><strong>Instantly Create Skeleton Screens & Animated Loading Effects with <code>.withShimmerAi()</code></strong></p>

<p><strong>shimmer_ai</strong> is a lightweight, zero-configuration Flutter package that instantly adds beautiful, smooth <strong>shimmer loading effects</strong> and <strong>skeleton screens</strong> to any widget — including Text, Images, Buttons, Cards, ListTiles, and more — with <strong>just one line of code!</strong> ✨</p>

<p>Perfect for creating engaging <strong>skeleton UIs</strong>, dynamic <strong>content placeholders</strong>, and polished preload states that enhance <strong>UI/UX</strong>, delight users, and make your app feel incredibly responsive and professional.</p>

<hr>

<h2>🚀 Key Features & Benefits</h2>
<ul>
<li>⚡️ <strong>Universal Application:</strong> Apply shimmer animations on any Flutter widget – no need to build custom placeholder widgets.</li>
<li>🧠 <strong>Minimal API:</strong> Just add <code>.withShimmerAi(loading: true)</code> to any widget.</li>
<li>🎨 <strong>Extensive Customization:</strong> Colors, duration, direction, tilt, border radius, loop, custom gradient.</li>
<li>🎯 <strong>Pixel‑Perfect Layout (v1.3.0+):</strong> Control width, height, margin, padding, decoration without wrappers.</li>
<li>⚙️ <strong>No External Dependencies</strong></li>
<li>✅ <strong>High Performance</strong></li>
<li>📱 <strong>Responsive & Adaptive</strong></li>
<li>💡 <strong>Perfect for:</strong> Loading states, skeleton UIs, onboarding animations, list/grid loaders.</li>
</ul>

<hr>

<h2>🎉 Getting Started</h2>
<pre><code>dependencies:
  shimmer_ai: ^1.3.0
</code></pre>
<pre><code>flutter pub get
</code></pre>
<pre><code>import 'package:shimmer_ai/shimmer_ai.dart';
</code></pre>

<hr>

<h2>💡 Simple Usage</h2>
<pre><code>Text('Loading Data').withShimmerAi(loading: true);
</code></pre>

Card(
child: Column(children: []),
).withShimmerAi(loading: true);
</code></pre>

<hr>

<h2>🔧 Advanced Usage & Customization</h2>

<h3>Direct Parameters</h3>
<pre><code>Text('Loading...')
  .withShimmerAi(
    loading: true,
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    borderRadius: 16,
    duration: Duration(seconds: 2),
    direction: ShimmerDirection.rtl,
    angle: 0.5,
    repeat: false,
    loopCount: 3,
  );
</code></pre>

<h3>Using ShimmerAiConfig</h3>
<pre><code>const myCustomShimmerConfig = ShimmerAiConfig(
  baseColor: Colors.deepPurple,
  highlightColor: Colors.purpleAccent,
  duration: Duration(milliseconds: 2500),
  direction: ShimmerDirection.btt,
  angle: -0.7,
  borderRadius: 8,
);
</code></pre>

CircleAvatar(radius: 50).withShimmerAi(
loading: true,
config: myCustomShimmerConfig,
);
</code></pre>

<h3>Custom Gradient</h3>
<pre><code>Container(
  width: 280,
  height: 60,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.blueGrey,
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Text('Animated Placeholder'),
).withShimmerAi(
  loading: true,
  customGradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.cyan.shade100,
      Colors.teal.shade50,
      Colors.cyan.shade100,
    ],
    stops: [0.0, 0.5, 1.0],
  ),
  duration: Duration(seconds: 3),
  angle: 0.8,
);
</code></pre>

<h3>Pixel‑Perfect Layout (v1.3.0+)</h3>
<pre><code>Text(' ')
  .withShimmerAi(
    loading: true,
    width: 160,
    height: 16,
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
  );
</code></pre>

<hr>

<h2>📸 Examples</h2>

<h3>Text Placeholder</h3>
<pre><code>Text(' ').withShimmerAi(
  loading: loading,
  width: 220,
  height: 12,
  margin: const EdgeInsets.only(bottom: 16),
  padding: const EdgeInsets.symmetric(horizontal: 8),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
);
</code></pre>

<h3>Image Placeholder</h3>
<pre><code>Image.network('https://picsum.photos/seed/ai/600/400', fit: BoxFit.cover)
  .withShimmerAi(
    loading: loading,
    width: 280,
    height: 160,
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
  );
</code></pre>

<h3>Circular Avatar</h3>
<pre><code>SizedBox.shrink().withShimmerAi(
  loading: loading,
  width: 64,
  height: 64,
  decoration: BoxDecoration(shape: BoxShape.circle),
);
</code></pre>

<h3>Button</h3>
<pre><code>ElevatedButton(onPressed: () {}, child: const Text('Continue'))
  .withShimmerAi(
    loading: loading,
    width: 200,
    height: 48,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
  );
</code></pre>

<h3>Card Placeholder</h3>
<pre><code>Card(
  child: SizedBox(
    height: 120,
    child: Center(
      child: Text(loading ? ' ' : 'Loaded Card Content'),
    ),
  ),
).withShimmerAi(
  loading: loading,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
);
</code></pre>

<h3>ListTile</h3>
<pre><code>ListTile(
  leading: const CircleAvatar(radius: 24),
  title: Text(loading ? ' ' : 'Title'),
  subtitle: Text(loading ? ' ' : 'Subtitle'),
).withShimmerAi(
  loading: loading,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
);
</code></pre>

<h3>Icon</h3>
<pre><code>Icon(Icons.star, size: 28).withShimmerAi(
  loading: loading,
  width: 44,
  height: 44,
  decoration: BoxDecoration(shape: BoxShape.circle),
);
</code></pre>

<h3>Grid</h3>
<pre><code>GridView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 6,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
  ),
  itemBuilder: (_, i) {
    return SizedBox.shrink().withShimmerAi(
      loading: loading,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    );
  },
);
</code></pre>

<hr>

<h2>🤝 Contributing</h2>
<p>We welcome PRs, bug reports, and suggestions! Open an issue or PR on <a href="https://github.com/karanpadaliya/shimmer_ai">GitHub</a>.</p>

<h2>📄 License</h2>
<p>MIT © <a href="https://github.com/karanpadaliya">karanpadaliya</a></p>

</body>
</html>
