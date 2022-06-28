import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_app/app/modules/home/presentation/widgets/feelling_card_widget.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UserAppbar(username: 'Gabriel'),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/home/user');
                  },
                  child: ClipOval(
                    child: Container(
                      color: AppColors.black,
                      height: 80,
                      width: 80,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(builder: (_) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return Observer(builder: (_) {
                        return FeelingCardWidget(
                          text: controller.list[index].model.title,
                          isClicked: controller.list[index].isClicked,
                          onPressed: () {
                            controller.alternateClick(
                              index,
                              controller.list[index].model,
                            );
                          },
                        );
                      });
                    });
              })),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            isLoading: false,
            onPressed: () {
              controller.selectFeeling.isEmpty
                  ? showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          title: Text(
                            'Escolha pelo menos um sentimento',
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
                            'Valide os sentimentos selecionados:',
                            style: AppTextStyles.cardH3
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          content: SizedBox(
                            height: 80,
                            width: 80,
                            child: ListView.builder(
                              itemCount: controller.selectFeeling.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Text(
                                  controller.selectFeeling[index].title,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyBoldH4,
                                );
                              },
                            ),
                          ),
                          actions: const [
                            Center(
                                child: CustomButton(
                                    isLoading: false, text: 'Vamos lá!')),
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
