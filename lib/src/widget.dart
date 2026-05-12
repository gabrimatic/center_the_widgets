import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Centers a child widget inside the available screen and limits its size.
///
/// This is useful for Flutter apps that were designed for phones first but
/// also run on web, desktop, tablets, foldables, or other wide displays.
class CenterTheWidgets extends StatelessWidget {
  /// The widget that should keep a mobile-friendly size.
  ///
  /// For app-wide behavior, wrap the root screen:
  ///
  /// ```dart
  /// runApp(MaterialApp(home: CenterTheWidgets(child: YourHomeWidget())));
  /// ```
  final Widget child;

  /// The maximum width assigned to [child] while [enabled] is true.
  ///
  /// Screens narrower than this value keep their own width. Wider screens show
  /// [child] at this width and use [alignment] to position it.
  final double maxWidthToResize;

  /// Optional maximum height assigned to [child] while [enabled] is true.
  ///
  /// Leave this null to let the child use the full available height.
  final double? maxHeightToResize;

  /// Whether the centering behavior is active.
  ///
  /// By default this follows [kIsWeb], so existing mobile apps keep their
  /// native layout unless you opt in with `enabled: true`.
  final bool enabled;

  /// The background color shown around the centered child.
  final Color color;

  /// The background image shown around the centered child.
  final ImageProvider? edgesImage;

  /// How [edgesImage] should be fitted into the available background.
  final BoxFit edgesImageFit;

  /// How [edgesImage] should be aligned inside the available background.
  final AlignmentGeometry edgesImageAlignment;

  /// Where the constrained child should sit inside the available background.
  final AlignmentGeometry alignment;

  /// Creates a centered, optionally size-limited surface for [child].
  const CenterTheWidgets({
    super.key,
    required this.child,
    this.color = const Color(0xfff8f8f8),
    this.maxWidthToResize = 600,
    this.maxHeightToResize,
    this.enabled = kIsWeb,
    this.edgesImage,
    this.edgesImageFit = BoxFit.cover,
    this.edgesImageAlignment = Alignment.center,
    this.alignment = Alignment.center,
  })  : assert(maxWidthToResize > 0),
        assert(maxHeightToResize == null || maxHeightToResize > 0);

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaSize = MediaQuery.maybeSizeOf(context);
        final availableWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : mediaSize?.width;
        final availableHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : mediaSize?.height;

        final width = availableWidth == null
            ? maxWidthToResize
            : math.min(availableWidth, maxWidthToResize);
        final height = switch ((availableHeight, maxHeightToResize)) {
          (final double availableHeight, final double maxHeight) =>
            math.min(availableHeight, maxHeight),
          _ => null,
        };

        return DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            image: edgesImage == null
                ? null
                : DecorationImage(
                    fit: edgesImageFit,
                    alignment: edgesImageAlignment,
                    image: edgesImage!,
                  ),
          ),
          child: Align(
            alignment: alignment,
            child: SizedBox(
              width: width,
              height: height,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
