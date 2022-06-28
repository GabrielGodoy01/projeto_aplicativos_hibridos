import 'package:flutter/material.dart';
import 'package:front_app/app/modules/user/controllers/user_controller.dart';
import 'package:front_app/app/modules/user/presentation/widgets/historic_card_widget.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';
import '../../../../shared/themes/app_colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    var controller = serviceLocator<UserController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),
                GestureDetector(
                  onTap: () {},
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
          const Text('Histórico de sentimentos'),
          Flexible(
            child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (builder, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: HistoricCardWidget(
                    title: controller.list[index].title,
                    date: controller.list[index].date,
                    description: controller.list[index].description,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
