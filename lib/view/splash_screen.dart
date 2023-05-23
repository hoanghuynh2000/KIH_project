import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kih_project/service/app_state.dart';
import 'package:kih_project/utils/app_assets.dart';
import 'package:kih_project/view/account/login_screen.dart';
import 'package:kih_project/view/introduce_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget screen = Container();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (AppState.instance.settingBox.read(TypeState.isFirstApp.toString()) == null) {
        Get.to(() => const OnBoardingPage());
      } else {
        Get.to(() => const LoginSreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.splash))),
      ),
    );
  }
}
