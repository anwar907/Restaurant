import 'package:flutter/material.dart';

extension BoldFont12 on TextStyle {
  TextStyle newStyle() {
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0);
  }
}

extension CustomPadding on Widget {
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);
}
