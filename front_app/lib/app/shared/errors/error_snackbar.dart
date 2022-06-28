import 'package:flutter/material.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';
import 'package:get/get.dart';

void showErrorSnackBar({required String errorMessage, Color? color}) {
  Get.dialog(SnackBar(
      duration: const Duration(seconds: 5),
      width: MediaQuery.of(Get.context!).size.width < 700 ? 300 : 500,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      backgroundColor: color ?? Colors.black.withOpacity(0.7),
      content: Text(
        errorMessage,
        style: AppTextStyles.bodyH4.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      )));
}
