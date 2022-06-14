import 'package:flutter/material.dart';
import 'package:front_app/app/injection_container.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'login_controller.dart';

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
      body: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(color: AppColors.black),
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
        ],
      ),
    );
  }
}
