import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';

class UserAppbar extends StatelessWidget {
  final String username;
  const UserAppbar({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
              text: 'Bem-vindo, ',
              style: AppTextStyles.titleH1.copyWith(color: AppColors.black),
              children: [
                TextSpan(
                    text: username,
                    style:
                        AppTextStyles.titleH1.copyWith(color: AppColors.black)),
              ]),
        ),
      ],
    );
  }
}
