# CenterTheWidgets

[![pub package](https://img.shields.io/pub/v/center_the_widgets.svg)](https://pub.dev/packages/center_the_widgets)
[![Pub Points](https://img.shields.io/pub/points/center_the_widgets)](https://pub.dev/packages/center_the_widgets/score)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](LICENSE)
[![Platform: Android | iOS | Linux | macOS | Web | Windows](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Linux%20%7C%20macOS%20%7C%20Web%20%7C%20Windows-lightgrey.svg)]()

CenterTheWidgets keeps mobile-first Flutter layouts centered and readable on web,
desktop, tablets, foldables, and other large screens.

Use it when an app was designed around a phone-sized surface, but still needs to
run cleanly on wider viewports. Wrap a screen, route, or app root, choose the
maximum width you trust, and let the rest of the screen become a controlled
background instead of stretched UI.

## At a Glance

| Need | What CenterTheWidgets does |
|------|----------------------------|
| Mobile layout on wide screens | Keeps the child at a maximum width and centers it in the available space. |
| Web and desktop release without a full responsive rewrite | Preserves the phone-sized surface while you plan deeper responsive work. |
| Branded or calmer side area | Fills the edges with a color or image. |
| App-wide behavior | Wrap the root screen so dialogs, sheets, and route content stay in the same centered surface. |
| Fine control | Tune width, optional height, child alignment, image fit, and image alignment. |

## Install

```yaml
dependencies:
  center_the_widgets: ^2.0.0
```

```dart
import 'package:center_the_widgets/center_the_widgets.dart';
```

## Quick Start

Wrap the part of the UI that should keep its mobile-sized surface:

```dart
return CenterTheWidgets(
  maxWidthToResize: 430,
  color: const Color(0xfff8f8f8),
  child: Scaffold(
    appBar: AppBar(title: const Text('Mobile-first screen')),
    body: const Center(child: Text('Readable on large screens')),
  ),
);
```

For app-wide behavior, wrap the root screen:

```dart
void main() {
  runApp(
    const MaterialApp(
      home: CenterTheWidgets(
        maxWidthToResize: 430,
        child: HomeScreen(),
      ),
    ),
  );
}
```

By default, `enabled` follows Flutter's `kIsWeb`. Set `enabled: true` when you
want the same centered surface on desktop, tablet, or mobile.

## Before And After

Without CenterTheWidgets:

<p align="center">
  <img src="https://github.com/gabrimatic/center_the_widgets/raw/master/example/without_center_the_widgets.png" width="760" alt="A mobile-first Flutter layout stretched across a wide screen">
</p>

With CenterTheWidgets:

<p align="center">
  <img src="https://github.com/gabrimatic/center_the_widgets/raw/master/example/with_center_the_widgets.png" width="760" alt="A mobile-first Flutter layout centered on a wide screen">
</p>

## Backgrounds

Use a color for a quiet edge area:

```dart
CenterTheWidgets(
  color: const Color(0xff101820),
  child: const HomeScreen(),
);
```

Use an image when the surrounding space should carry visual identity:

```dart
CenterTheWidgets(
  edgesImage: const AssetImage('assets/background.jpg'),
  edgesImageFit: BoxFit.cover,
  edgesImageAlignment: Alignment.center,
  child: const HomeScreen(),
);
```

The color is still painted behind the image, so transparent images and loading
states have a stable fallback.

## Size And Alignment

```dart
CenterTheWidgets(
  maxWidthToResize: 430,
  maxHeightToResize: 932,
  alignment: Alignment.topCenter,
  child: const CheckoutFlow(),
);
```

| Option | Default | Notes |
|--------|---------|-------|
| `maxWidthToResize` | `600` | Maximum width assigned to the child while enabled. |
| `maxHeightToResize` | `null` | Optional maximum height. Leave null for full available height. |
| `enabled` | `kIsWeb` | Set true to opt in outside web. |
| `color` | `Color(0xfff8f8f8)` | Background color around the child. |
| `edgesImage` | `null` | Optional background image around the child. |
| `edgesImageFit` | `BoxFit.cover` | Fit used by `edgesImage`. |
| `edgesImageAlignment` | `Alignment.center` | Image alignment used by `edgesImage`. |
| `alignment` | `Alignment.center` | Child position inside the available space. |

## Example

```bash
cd example
flutter run -d chrome
```

The example intentionally uses an oversized child so the package behavior is
easy to see.

## Compatibility

CenterTheWidgets 2.x targets Dart 3 and current Flutter stable releases. Use the
1.x line only if you still need the old Dart 2 constraint.

## License

MIT. See [LICENSE](LICENSE).
