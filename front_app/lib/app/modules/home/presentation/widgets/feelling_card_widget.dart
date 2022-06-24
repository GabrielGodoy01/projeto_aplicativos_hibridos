import 'package:flutter/material.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';

import '../../../../shared/themes/app_colors.dart';

class FeelingCardWidget extends StatelessWidget {
  final bool isClicked;
  final Function()? onPressed;
  final String text;
  const FeelingCardWidget(
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
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: AppTextStyles.titleH2,
            ),
          ),
          isClicked
              ? const Positioned(
                  right: 0,
                  top: 4,
                  child: Icon(
                    Icons.check,
                    size: 28,
                    color: AppColors.black,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
