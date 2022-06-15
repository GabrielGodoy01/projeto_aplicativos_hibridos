import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_app/app/modules/home/widgets/feelling_card.dart';
import 'package:front_app/app/modules/home/widgets/user_appbar.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';

import '../../injection_container.dart';
import '../../shared/widgets/custom_button.dart';
import 'home_controller.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const UserAppbar(username: 'Gabriel'),
              ClipOval(
                child: Container(
                  color: AppColors.black,
                  height: 80,
                  width: 80,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(builder: (_) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return FeelingCard(
                      text: controller.list[index].model.title,
                      isClicked: controller.list[index].isClicked,
                      onPressed: () {
                        controller.alternateClick(index);
                      },
                    );
                  });
            }),
          ),
          CustomButton(
            isLoading: false,
            onPressed: () {},
            text: 'Continuar',
          ),
        ],
      ),
    );
  }
}
