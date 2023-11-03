import 'package:flutter/material.dart';
import 'package:money_mate/constant/constant.dart';
import 'package:money_mate/launcher.dart';
import 'package:money_mate/pages/login.dart';
import 'package:money_mate/pages/home.dart';
import 'package:money_mate/pages/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Money Mate',
    home: const LauncherPage(),
    theme: ThemeData(primaryColor: const Color.fromARGB(255, 246, 246, 233)),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => const LauncherPage(),
      HOME_SCREEN: (BuildContext context) => const Login(),
      REGISTRATION_SCREEN: (BuildContext context) => const RegistrationPage(),
      HOME_PAGE: (BuildContext context) => const HomePage(),
    },
  ));
}
