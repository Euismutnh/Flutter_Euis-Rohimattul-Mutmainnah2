import 'package:flutter/material.dart';
import 'package:money_mate/models/expense_data.dart';
import 'package:money_mate/models/planning_data.dart';
import 'package:provider/provider.dart';
import 'package:money_mate/constant/constant.dart';
import 'package:money_mate/launcher.dart';
import 'package:money_mate/models/income_data.dart';

import 'Menu/debt.dart';
import 'Menu/expense_page.dart';
import 'Menu/income.dart';
import 'Menu/planning.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IncomeData>(create: (_) => IncomeData()),
        ChangeNotifierProvider<ExpenseData>(create: (_) => ExpenseData()),
        ChangeNotifierProvider<PlanningData>(create: (_) => PlanningData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Mate',
      home: const LauncherPage(),
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 246, 246, 233)),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => const LauncherPage(),
        HOME_SCREEN: (BuildContext context) => const Login(),
        REGISTRATION_SCREEN: (BuildContext context) => const RegistrationPage(),
        HOME_PAGE: (BuildContext context) => const HomePage(),
        DEBT_PAGE: (BuildContext context) => const DebtPage(),
        PLANNING_PAGE: (BuildContext context) => const PlanningPage(),
        INCOME_PAGE: (BuildContext context) => const IncomePage(),
        EXPENSE_PAGE: (BuildContext context) => const ExpensePage(),
      },
    );
  }
}
