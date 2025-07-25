<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.
-->

<h1>✨ shimmer_ai – Effortless Shimmer Effect for Any Flutter Widget</h1>

<p><strong>shimmer_ai</strong> is a minimal, easy-to-use Flutter package that lets you apply beautiful shimmer loading effects on <em>any widget</em> with just one line of code.</p>

<p>Perfect for skeleton loading screens, user placeholders, or preloading UI states in Flutter apps. Built with performance and simplicity in mind.</p>

<hr>

<h2>🚀 Features</h2>
<ul>
  <li>⚡ Add shimmer to <code>any widget</code> – Text, Image, Cards, Buttons, ListTiles, etc.</li>
  <li>🧠 Minimal API – Just use <code>.withShimmerAi(loading: true)</code></li>
  <li>🎨 Customizable shimmer color and radius</li>
  <li>📱 Responsive and fast with zero configuration</li>
  <li>✅ Fully tested and production-ready</li>
</ul>

<h3>Example:</h3>
<pre><code class="language-dart">
Text('Hello').withShimmerAi(loading: true);
</code></pre>

<hr>

<h2>📦 Getting Started</h2>

<p>To use <code>shimmer_ai</code>, add it to your <code>pubspec.yaml</code>:</p>

<pre><code class="language-yaml">
dependencies:
  shimmer_ai: ^1.1.0
</code></pre>

<p>Then run <code>flutter pub get</code> in your terminal.</p>

<hr>

<h2>💡 Usage</h2>

<p>Wrap any widget using the shimmer extension:</p>

<pre><code class="language-dart">
import 'package:shimmer_ai/shimmer_ai.dart';

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      // Shimmer on text
      Text('Welcome').withShimmerAi(loading: true),

      // Shimmer on image
      Image.network('https://example.com/image.jpg')
          .withShimmerAi(loading: true),

      // Shimmer on card
      Card(
        child: ListTile(
          title: Text('User'),
        ),
      ).withShimmerAi(loading: isLoading),
    ],
  );
}
</code></pre>

<p>Control shimmer style using optional parameters:</p>

<pre><code class="language-dart">
Text('Loading...')
  .withShimmerAi(
    loading: true,
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    borderRadius: 12,
  );
</code></pre>

<hr>

<h2>📁 Example App</h2>

<p>Check out the full working demo in the <code>/example</code> folder:</p>

<pre><code>
git clone https://github.com/karanpadaliya/shimmer_ai.git
cd shimmer_ai/example
flutter run
</code></pre>

<hr>

<h2>📚 Additional Information</h2>

<ul>
  <li>For issues or feature requests, visit the <a href="https://github.com/karanpadaliya/shimmer_ai/issues">GitHub Issue Tracker</a></li>
  <li>Pull requests and contributions are welcome</li>
  <li>Maintained by <strong>Karan Padaliya</strong> – a passionate Flutter developer</li>
  <li>License: <code>MIT</code></li>
</ul>

<p>✨ If you like this package, don't forget to ⭐ it on <a href="https://pub.dev/packages/shimmer_ai">pub.dev</a> and <a href="https://github.com/karanpadaliya/shimmer_ai">GitHub</a>!</p>

<hr>

<p><em>#flutter #shimmer #flutterui #skeletonloading #flutterpackage #flutterdev #flutteropensource</em></p>
