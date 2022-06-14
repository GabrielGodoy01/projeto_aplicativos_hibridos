import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF151A27);
  static const darkGrey = Color(0xFF494950);
  static const lilac = Color(0xFFE1E1E5);
  static const white = Colors.white;

  static final BoxShadow clickShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 4,
    offset: const Offset(0.0, 4),
  );
}
