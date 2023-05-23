import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kih_project/service/app_state.dart';
import 'package:kih_project/utils/app_assets.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:kih_project/view/account/login_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.to(const LoginSreen());
    AppState.instance.settingBox.write(TypeState.isFirstApp.toString(), false);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      imageAlignment: Alignment.center,
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: AppColors.black),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 70),
      bodyAlignment: Alignment.topCenter,
      // contentMargin: const EdgeInsets.symmetric(horizontal: 16),

      bodyFlex: 1,
      imageFlex: 3,
    );

    return Scaffold(
        body: IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Kết nối từ xa",
          body: "Kết nối với bệnh viện nhanh chóng, tiện lợi và dễ dàng qua ứng dụng",
          image: _buildImage(AppAssets.w2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Theo dõi kết quả",
          body: "Cập nhật tình hình sức khỏe ngay khi có kết quả",
          image: _buildImage(AppAssets.w1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tư vấn tại nhà",
          body: "Giúp bệnh nhân có thể theo dõi sức khỏe tại nhà qua với sự trợ giúp của bác sĩ trực tuyến",
          image: _buildImage(AppAssets.w3),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text('Bỏ qua', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.titleColor)),
      next: const Text('Tiếp tục', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.titleColor)),
      done: const Text('Bắt đầu', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.titleColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.titleColor,
        color: AppColors.greyLight,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    ));
  }
}
