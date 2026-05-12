import 'package:center_the_widgets/center_the_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpCenteredWidget(
    WidgetTester tester, {
    required Widget child,
    double maxWidthToResize = 600,
    double? maxHeightToResize,
    bool enabled = true,
    Color color = const Color(0xfff8f8f8),
    AlignmentGeometry alignment = Alignment.center,
    Size surfaceSize = const Size(1200, 800),
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = surfaceSize;
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      MaterialApp(
        home: CenterTheWidgets(
          maxWidthToResize: maxWidthToResize,
          maxHeightToResize: maxHeightToResize,
          enabled: enabled,
          color: color,
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }

  testWidgets('limits the child width on wide screens', (tester) async {
    const childKey = Key('child');

    await pumpCenteredWidget(
      tester,
      maxWidthToResize: 430,
      child: const SizedBox.expand(key: childKey),
    );

    expect(tester.getSize(find.byKey(childKey)), const Size(430, 800));
    expect(tester.getCenter(find.byKey(childKey)).dx, 600);
  });

  testWidgets('uses the available width on narrow screens', (tester) async {
    const childKey = Key('child');

    await pumpCenteredWidget(
      tester,
      maxWidthToResize: 430,
      surfaceSize: const Size(320, 800),
      child: const SizedBox.expand(key: childKey),
    );

    expect(tester.getSize(find.byKey(childKey)), const Size(320, 800));
  });

  testWidgets('can limit the child height', (tester) async {
    const childKey = Key('child');

    await pumpCenteredWidget(
      tester,
      maxWidthToResize: 430,
      maxHeightToResize: 600,
      child: const SizedBox.expand(key: childKey),
    );

    expect(tester.getSize(find.byKey(childKey)), const Size(430, 600));
    expect(tester.getCenter(find.byKey(childKey)), const Offset(600, 400));
  });

  testWidgets('returns the child directly when disabled', (tester) async {
    const childKey = Key('child');

    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: CenterTheWidgets(
            enabled: false,
            child: SizedBox(key: childKey, width: 123, height: 45),
          ),
        ),
      ),
    );

    expect(find.byType(DecoratedBox), findsNothing);
    expect(tester.getSize(find.byKey(childKey)), const Size(123, 45));
  });

  testWidgets('paints the configured background color', (tester) async {
    await pumpCenteredWidget(
      tester,
      color: Colors.blueGrey,
      child: const SizedBox.shrink(),
    );

    final decoratedBox = tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    final decoration = decoratedBox.decoration as BoxDecoration;

    expect(decoration.color, Colors.blueGrey);
  });

  testWidgets('honors custom child alignment', (tester) async {
    const childKey = Key('child');

    await pumpCenteredWidget(
      tester,
      maxWidthToResize: 430,
      alignment: Alignment.topCenter,
      child: const SizedBox.expand(key: childKey),
    );

    expect(tester.getTopLeft(find.byKey(childKey)), const Offset(385, 0));
  });
}
