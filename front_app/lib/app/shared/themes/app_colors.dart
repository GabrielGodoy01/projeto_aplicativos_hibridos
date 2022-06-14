import 'package:flutter/material.dart';

class AppColors {
  static const brandingBlue = Color(0xFF022893);
  static const lightBlue = Color(0xFF025AC8);
  static const background = Color(0xFFFFFFFF);
  static const generalLetter = Color(0xFF151A27);
  static const lightLetter = Color(0xFF494950);
  static const shape = Color(0xFFE1E1E5);
  static const white = Colors.white;

  static final BoxShadow clickShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 4,
    offset: const Offset(0.0, 4),
  );
}
