import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_app/app/injection_container.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'package:front_app/app/shared/widgets/custom_button.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var controller = serviceLocator<LoginController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(color: AppColors.black),
              ),
            ),
            const SizedBox(
              height: 64,
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
                await controller.login();
              },
              text: 'Entrar',
            ),
          ],
        ),
      ),
    );
  }
}
