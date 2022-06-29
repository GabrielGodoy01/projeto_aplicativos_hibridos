import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = serviceLocator<RegisterController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/feelings.png'),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              'Cadastro',
              style: AppTextStyles.titleH1,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: controller.setEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelStyle: TextStyle(color: AppColors.black),
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.mail,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(
              builder: (_) {
                return TextField(
                  onChanged: controller.setPassword,
                  obscureText: controller.passwordVisibility,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: AppColors.black),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Senha',
                      suffixIcon: InkWell(
                        onTap: controller.changePasswordVisibility,
                        child: Icon(
                          controller.passwordVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.black,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: AppColors.black,
                      )),
                );
              },
            ),
            const SizedBox(
              height: 64,
            ),
            CustomButton(
              isLoading: controller.isLoading,
              onPressed: () async {
                await controller.register();
              },
              text: 'Registrar',
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  'Já tenho cadastro',
                  style: AppTextStyles.titleH2,
                ))
          ],
        ),
      ),
    );
  }
}
