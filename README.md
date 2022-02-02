## Center any widget in Flutter

---

*A simple widget that shows its child in the center of the screen.*

### What is this widget?

---
**When** you are working with small screens like mobiles, everything is bright as you develop them. But, **What if** you want to publish your app for the web or large devices? All of your designs will be **corrupted**! As long as the screen gets bigger, your beautiful designed elements get to stretch!

The best solution is to write your code fully responsive to handle every screen size;
##### But, What if you don't have **time** for that? Or you want to keep your mobile design on other platforms too?

That's why I developed this package!
You can wrap any widget that you want to keep its size, with CenterTheWidgets!
##### You want to do this for your whole app?
Just wrap your root widget with CenterTheWidget, and after that, all of your dialogs and widgets will respect your design, and your design will be as beautiful as it was.
```dart
  runApp(MaterialApp(home: CenterTheWidgets(child: YourHomeWidget())));
```

##### What about the edges? What will be shown on the rest of the screen?
It is so easy! You can pass the color or edgesImage parameters to make edges more gorgeous!


### How to use it?

---
**1.  Add the package to pubspec.yaml dependency:**

```yaml
dependencies:
  center_the_widgets: ^1.0.0
```

**2. Import package:**

```dart
import 'package:center_the_widgets/center_the_widgets.dart';
```

**3. Wrap any widget with CenterTheWidgets to show them in the center of the screen:**
```dart
    return CenterTheWidgets(
      child: Scaffold(
        body: const Text('Hi!'),
      ),
    );
```