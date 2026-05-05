import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// Extension for [Expanded]
  Expanded expand({Key? key, int flex = 1}) {
    return Expanded(key: key, flex: flex, child: this);
  }

  /// Extension for [Flexible]
  Flexible flexible({Key? key, int flex = 1}) {
    return Flexible(key: key, flex: flex, child: this);
  }

  /// Extension for Stack [Positioned]
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? height,
    double? width,
    bool isFilled = false,
  }) {
    return isFilled
        ? Positioned.fill(
            key: key,
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            child: this,
          )
        : Positioned(
            key: key,
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            height: height,
            width: width,
            child: this,
          );
  }

  /// Extension for adding a corner radius a widget with [ClipRRect]
  ClipRRect cornerRadius(double radius) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }

  /// Gives custom padding from all sides by [value].
  Padding p(double value, {Key? key}) {
    return Padding(key: key, padding: EdgeInsets.all(value), child: this);
  }

  /// Gives custom padding from all sides by [left] [top] [right] [bottom].
  Padding pLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    Key? key,
  }) => Padding(
    key: key,
    padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: this,
  );

  /// Gives custom padding symmetrically by [v] [h].
  Padding pSymmetric({Key? key, double v = 0.0, double h = 0.0}) => Padding(
    key: key,
    padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
    child: this,
  );

  /// Gives custom padding by only [left] [top] [right] [bottom].
  Padding pOnly({
    Key? key,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) => Padding(
    key: key,
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );
}
