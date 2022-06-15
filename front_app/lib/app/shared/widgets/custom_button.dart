import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isLoading;
  final String text;
  const CustomButton(
      {Key? key, this.onPressed, required this.isLoading, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * .7, 50),
        alignment: Alignment.center,
        primary: AppColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyBoldH4.copyWith(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width < 1300 ? 20 : 24,
              ),
            ),
    );
  }
}
