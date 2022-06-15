import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF151A27);
  static const darkGrey = Color(0xFF494950);
  static const card = Color.fromARGB(255, 167, 178, 194);
  static const cardClicked = Color.fromARGB(255, 176, 182, 192);
  static const background = Color(0xFFECF0F3);
  static const white = Colors.white;

  static final BoxShadow clickShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 4,
    offset: const Offset(0.0, 4),
  );
}
