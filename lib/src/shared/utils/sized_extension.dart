import 'package:flutter/material.dart';

extension SizeExtension on num {
  double get h =>
      (this / 812) *
      // ignore: deprecated_member_use
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  double get w =>
      (this / 375) *
      // ignore: deprecated_member_use
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
}
