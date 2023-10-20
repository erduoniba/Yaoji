import 'dart:math';
import 'package:flutter/material.dart';

class YJColor {
  static Color randomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static Color themeColor() {
    return const Color(0xFFA88B4E);
  }

  static Color tipColor() {
    return Colors.black12;
  }

  static Color titleColor() {
    return Colors.black;
  }

  static Color contentColor() {
    return Colors.black54;
  }
}
