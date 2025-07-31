# ✨ shimmer_ai – Effortless Flutter Shimmer

**Instantly Create Skeleton Screens & Animated Loading Effects with `.withShimmerAi()`**

**shimmer_ai** is a lightweight, zero-configuration Flutter package that instantly adds beautiful, smooth **shimmer loading effects** and **skeleton screens** to any widget — including Text, Images, Buttons, Cards, ListTiles, and more — with **just one line of code**! ✨

Perfect for creating engaging **skeleton UIs**, dynamic **content placeholders**, and polished preload states that enhance **UI/UX**, delight users, and make your app feel incredibly responsive and professional.

---

## 🚀 Key Features & Benefits

- ⚡️ **Universal Application:** Apply **shimmer animations** on *any* Flutter widget – no need to build custom placeholder widgets.
- 🧠 **Intuitive & Minimal API:** Simply add `.withShimmerAi(loading: true)` to any widget for instant **animated loading indicators**.
- 🎨 **Extensive Customization:** Fine-tune your **shimmer effect** with:
    - `baseColor`, `highlightColor`: Set shimmer colors
    - `duration`: Control animation speed
    - `direction`: Choose animation direction (LTR, RTL, TTB, BTT)
    - `angle`: Control shimmer tilt
    - `borderRadius`: Customize shape
    - `repeat`, `loopCount`: Manage animation loop
    - `customGradient`: Define a custom gradient
- ⚙️ **Zero External Dependencies:** Built entirely inside **shimmer_ai**, no third-party packages needed.
- ✅ **High Performance & Production-Ready**
- 📱 **Responsive & Adaptive:** Works across mobile, web, desktop
- 💡 **Ideal for:**
    - Loading states
    - Skeleton UIs / Skeleton screens
    - Content placeholders
    - Onboarding animations
    - List and grid loaders
    - Any async data loading

---

## 🎉 Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  shimmer_ai: ^1.2.0 # Use latest version
```

Then run:

```bash
flutter pub get
```

---

## 💡 Simple Usage

Import the package:

```dart
import 'package:shimmer_ai/shimmer_ai.dart';
```

Use `.withShimmerAi()` on any widget:

```dart
// Example: Text shimmer
Text('Loading Data').withShimmerAi(loading: isLoading);

// Example: Card shimmer
Card(
  child: Column(
    children: [
      // ... content
    ],
  ),
).withShimmerAi(loading: isFetchingData);
```

---

## 🔧 Advanced Usage & Customization

### Direct Parameters

```dart
Text('Loading...')
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
```

### Using `ShimmerAiConfig`

```dart
const myCustomShimmerConfig = ShimmerAiConfig(
  baseColor: Colors.deepPurple,
  highlightColor: Colors.purpleAccent,
  duration: Duration(milliseconds: 2500),
  direction: ShimmerDirection.btt,
  angle: -0.7,
  borderRadius: 8,
);

CircleAvatar(
  radius: 50,
).withShimmerAi(
  loading: true,
  config: myCustomShimmerConfig,
);
```

You can override config values too:

```dart
Container(
  width: 150,
  height: 30,
).withShimmerAi(
  loading: true,
  config: myCustomShimmerConfig,
  direction: ShimmerDirection.ltr,
);
```

### Custom Gradient Shimmer

```dart
Container(
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
```

---

## 📸 Screenshots & Examples

Check the [example directory](https://github.com/karanpadaliya/shimmer_ai/tree/main/example) for full demos.

---

## 🤝 Contributing

We welcome PRs, bug reports, and suggestions! Feel free to open an issue or pull request on [GitHub](https://github.com/karanpadaliya/shimmer_ai).

---

## 📄 License

MIT © [karanpadaliya](https://github.com/karanpadaliya)  
[View License](https://github.com/karanpadaliya/shimmer_ai/blob/main/LICENSE)
