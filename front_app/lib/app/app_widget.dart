import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:front_app/app/modules/home/presentation/pages/home_page.dart';
import 'package:front_app/app/modules/login/presentation/pages/login_page.dart';
import 'package:front_app/app/modules/register/presentation/pages/register_page.dart';
import 'package:front_app/app/modules/user/presentation/pages/user_page.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    return GetMaterialApp(
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scrollBehavior: AppScrollBehavior(),
      title: 'P2',
      theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: const ColorScheme.light().copyWith(
            primary: AppColors.black,
            secondary: AppColors.white,
          ),
          textTheme: TextTheme(
            bodyText1: AppTextStyles.titleH1,
            bodyText2: AppTextStyles.titleH1,
          ),
          appBarTheme: const AppBarTheme(
            color: AppColors.black,
          ),
          scaffoldBackgroundColor: AppColors.background),
      home: const LoginPage(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/home/user', page: () => const UserPage()),
      ],
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
