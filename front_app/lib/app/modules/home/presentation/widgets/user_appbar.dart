import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class UserAppbar extends StatelessWidget {
  const UserAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: 'Bem-vindo!',
            style: AppTextStyles.titleH1.copyWith(color: AppColors.black),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/home/user');
          },
          child: ClipOval(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/images/pikachu.png',
                  fit: BoxFit.fitHeight),
            ),
          ),
        )
      ],
    );
  }
}
