import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:kih_project/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(ScreenUtilInit(designSize: const Size(414, 902), minTextAdapt: true, splitScreenMode: true, builder: (ctx, child) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.greyLight,
            ),
            elevation: 0),
        primaryColor: AppColors.primaryColor,
        focusColor: AppColors.white,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white, primary: AppColors.primaryColor).copyWith(secondary: AppColors.error),
      ),
      home: SplashScreen(),
    );
  }
}
