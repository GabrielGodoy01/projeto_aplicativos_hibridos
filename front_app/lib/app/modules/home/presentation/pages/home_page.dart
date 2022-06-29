import 'package:flutter/material.dart';
import 'package:front_app/app/modules/home/presentation/widgets/user_appbar.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = serviceLocator<HomeController>();
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: UserAppbar(),
          ),
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              onChanged: controller.setPhrase,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(color: AppColors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText:
                      'Digite, EM INGLÊS, como você está se sentindo hoje:',
                  prefixIcon: Icon(
                    Icons.edit,
                    color: AppColors.black,
                  )),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          CustomButton(
            isLoading: false,
            onPressed: () {
              controller.phrase.isEmpty || controller.phrase == ''
                  ? showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          title: Text(
                            'Digite algo para poder continuar',
                            style: AppTextStyles.cardH3
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            Center(
                              child: CustomButton(
                                isLoading: false,
                                text: 'Entendi',
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        );
                      })
                  : showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          title: Text(
                            'Tem certeza sobre o que escreveu? Está em inglês?',
                            style: AppTextStyles.cardH3
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Center(
                                child: CustomButton(
                              isLoading: false,
                              text: 'Vamos lá!',
                              onPressed: () {
                                controller.postPhrase();
                              },
                            )),
                          ],
                        );
                      });
            },
            text: 'Continuar',
          ),
        ],
      ),
    );
  }
}
