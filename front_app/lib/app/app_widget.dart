import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';
import 'package:intl/intl.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final ScaffoldMessengerState scaffold = scaffoldKey.currentState!;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login');
    Intl.defaultLocale = 'pt_BR';
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: scaffoldKey,
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scrollBehavior: AppScrollBehavior(),
      title: 'Semana Mauá de Inovação, Liderança e Empreendedorismo',
      theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: const ColorScheme.light().copyWith(
            primary: AppColors.generalLetter,
            secondary: AppColors.generalLetter,
          ),
          textTheme: TextTheme(
            bodyText1: AppTextStyles.titleH1,
            bodyText2: AppTextStyles.titleH1,
          ),
          appBarTheme: const AppBarTheme(
            color: AppColors.generalLetter,
          ),
          scaffoldBackgroundColor: AppColors.generalLetter),
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
