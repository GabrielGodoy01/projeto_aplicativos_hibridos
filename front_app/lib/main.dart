import 'package:flutter/material.dart';
import 'app/injection_container.dart' as injection;
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();

  runApp(const AppWidget());
}
