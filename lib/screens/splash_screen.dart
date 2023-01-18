// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/features/sign_up/presentation/pages/signup_screen.dart';
import 'package:practice_application/screens/data_screen.dart';
import 'package:practice_application/utils/constants/color_constants.dart';
import 'package:practice_application/utils/helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), ()=> Get.offAndToNamed(DataScreen.routeName));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final Helpers _helpers = Helpers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            "images/byteridge.png",
            height: _helpers.getHeight(context) * 0.3,
            width: _helpers.getHeight(context) * 0.3,
          ),
        ),
      ),
    );
  }
}
