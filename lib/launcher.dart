import 'dart:async';
import 'package:flutter/material.dart';
import 'constant/constant.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();

    // Menggunakan Future.delayed untuk menunggu animasi selesai sebelum navigasi
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _visible = !_visible;
      });
      navigationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 233),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 246, 246, 233)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to our Platform'),
                const Padding(padding: EdgeInsets.all(8)),
                Image.asset(
                  'assets/logo.png',
                  width: animation.value * 300,
                  height: animation.value * 400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
