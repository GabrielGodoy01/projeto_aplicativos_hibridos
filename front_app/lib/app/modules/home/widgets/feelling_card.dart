import 'package:flutter/material.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';

import '../../../shared/themes/app_colors.dart';

class FeelingCard extends StatelessWidget {
  final bool isClicked;
  final Function()? onPressed;
  final String text;
  const FeelingCard(
      {Key? key, required this.isClicked, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isClicked ? AppColors.cardClicked : AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Center(
        child: isClicked
            ? const Icon(
                Icons.check,
                color: AppColors.black,
              )
            : Text(
                text,
                style: AppTextStyles.titleH2,
              ),
      ),
    );
  }
}
