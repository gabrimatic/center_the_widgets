## Center any widget in Flutter

------------

Sometimes you want to deploy your mobile design-based application for large screens on the #web or desktop, and you didn't write any #code to make it responsive!
‌

🤝 CenterTheWidgets is developed to handle this for you.

### What is this widget?

------------
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

* Without CenterTheWidgets:
<img src="https://github.com/gabrimatic/center_the_widgets/raw/master/example/without_center_the_widgets.png"/>

* With CenterTheWidgets:
<img src="https://github.com/gabrimatic/center_the_widgets/raw/master/example/with_center_the_widgets.png"/>


### How to use it?

------------
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

## Developer
By [Hossein Yousefpour](https://gabrimatic.info "Hossein Yousefpour")

&copy; All rights reserved.

## Donate
* <a href="https://www.buymeacoffee.com/gabrimatic" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Book" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

OR

* ETH Address: **0xc2F103b11C5d7bE3Abe292EE549a3ba418655A0E**
