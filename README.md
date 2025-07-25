<h1>✨ shimmer_ai – Effortless Flutter Shimmer with the `.withShimmerAi()` Extension</h1>

<p><strong>shimmer_ai</strong> is a lightweight, zero-configuration Flutter package that instantly adds beautiful, smooth shimmer loading animations to <strong>any widget</strong> — Text, Images, Buttons, Cards, ListTiles, and more — with <strong>just one line of code</strong>!</p>

<p>Perfect for creating stunning skeleton loaders, loading placeholders, and polished preload UI states that delight users and keep your app feeling responsive and professional.</p>

<hr>

<h2>🚀 Key Features</h2>

<ul>
  <li>⚡ <strong>Universal shimmer wrapper:</strong> Apply shimmer on <em>any</em> widget type — no need to build custom placeholders</li>
  <li>🧠 <strong>Minimal & intuitive API:</strong> Simply add <code>.withShimmerAi(loading: true)</code> and you’re done!</li>
  <li>🎨 <strong>Customizable shimmer styles:</strong> Control base color, highlight color, shimmer radius, and animation speed</li>
  <li>⚙️ <strong>Zero setup required:</strong> Built for instant integration and lightning-fast performance</li>
  <li>📱 <strong>Responsive & adaptive:</strong> Works seamlessly on all screen sizes and Flutter platforms (mobile, web, desktop)</li>
  <li>✅ <strong>Production-ready:</strong> Fully tested, null-safe, and easy to maintain</li>
</ul>

<hr>

<h2>🎉 Getting Started</h2>

<p>Add the package to your project's <code>pubspec.yaml</code>:</p>

<pre><code>dependencies:
  shimmer_ai: ^1.1.0
</code></pre>

<p>Then run:</p>

<pre><code>flutter pub get
</code></pre>

<hr>

<h2>💡 Simple Usage</h2>

<p>Import the package in your Dart file:</p>

<pre><code>import 'package:shimmer_ai/shimmer_ai.dart';
</code></pre>

<p>Wrap any widget with the <code>.withShimmerAi()</code> extension method:</p>

<pre><code>Text('Loading Data').withShimmerAi(loading: true);
</code></pre>

<hr>

<h2>🔧 Example Usage</h2>

<pre><code>Column(
  children: [
    // Shimmer on simple text
    Text('Welcome to shimmer_ai').withShimmerAi(loading: isLoading),

    // Shimmer on images
    Image.network('https://example.com/avatar.jpg').withShimmerAi(loading: isLoading),

    // Shimmer wrapping complex widgets like Cards or ListTiles
    Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage('https://example.com/profile.jpg')),
        title: Text('John Doe'),
        subtitle: Text('Software Developer'),
      ),
    ).withShimmerAi(loading: isLoading),
  ],
);
</code></pre>

<hr>

<h2>🎨 Customizing Shimmer Appearance</h2>

<p>Control shimmer color, border radius, and animation duration easily:</p>

<pre><code>Text('Please wait...')
  .withShimmerAi(
    loading: true,
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    borderRadius: 16,
    duration: const Duration(seconds: 2),
  );
</code></pre>

<hr>

<h2>📦 Full Example App</h2>

<p>Try out the fully working demo bundled in the <code>example</code> folder:</p>

<pre><code>git clone https://github.com/karanpadaliya/shimmer_ai.git
cd shimmer_ai/example
flutter run
</code></pre>

<p>Explore real-world use cases showing shimmer with list views, cards, avatars, buttons, and more.</p>

<hr>

<h2>❓ Support & Contributions</h2>

<ul>
  <li>Found a bug or want a new feature? <a href="https://github.com/karanpadaliya/shimmer_ai/issues">Open an Issue here</a></li>
  <li>Contributions, improvements, and pull requests are always welcome!</li>
  <li>Maintained by <strong>Karan Padaliya</strong> – passionate Flutter developer and enthusiast.</li>
</ul>

<hr>

<h2>📃 License</h2>

<p>This project is <strong>MIT licensed</strong> – see the <a href="https://github.com/karanpadaliya/shimmer_ai/blob/main/LICENSE">LICENSE</a> file for details.</p>

<hr>

<p>⭐️ If you enjoy using <strong>shimmer_ai</strong>, please give it a star on <a href="https://pub.dev/packages/shimmer_ai">pub.dev</a> and <a href="https://github.com/karanpadaliya/shimmer_ai">GitHub</a>. Your support means a lot!</p>

<hr>

<p><em>#flutter #shimmer #skeletonloader #loadinganimation #flutterui #flutterpackage #flutteropensource</em></p>

<hr>

<h2>Why Choose shimmer_ai?</h2>

<p>Most shimmer packages require you to manually build skeleton placeholders for every widget, which is tedious and error-prone.</p>

<p><strong>shimmer_ai</strong> does all the hard work for you by <em>automatically</em> detecting widget types and applying matching shimmer placeholders — saving you hours of development time while keeping your code clean and maintainable.</p>

<hr>

<h2>Contact</h2>

<p>For questions or guidance, feel free to reach out on the GitHub repository or open an issue. Happy Fluttering! 🚀</p>
