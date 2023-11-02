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

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 246, 246, 233),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(1, 246, 246, 233)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to our Platform'),
                const Padding(padding: EdgeInsets.all(8)),
                Image.asset(
                  'images/logo.jpg',
                  width: animation.value * 200,
                  height: animation.value * 200,
                ),
                const Text('Money' 'Mate')
              ],
            )
          ],
        ),
      ),
    );
  }
}
