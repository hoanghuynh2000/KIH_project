import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kih_project/utils/app_assets.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:kih_project/view/account/foget_password.dart';
import 'package:kih_project/view/account/register_screen.dart';
import 'package:kih_project/widget/custom_button.dart';
import 'package:kih_project/widget/custom_text.dart';
import 'package:kih_project/widget/custom_textfield.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudButton,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.brLogin), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppAssets.image_logo,
              width: 170,
            ),
            SizedBox(
              height: 10,
            ),
            _buildFormLogin()
          ],
        ).paddingAll(30),
      ).onTap(() {
        FocusManager.instance.primaryFocus!.unfocus();
      }),
    );
  }

  Widget _buildFormLogin() {
    return Container(
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            CustomTextField(
              hideText: 'Nhập số điện thoại',
              controller: phoneController,
              typeInput: TypeInput.phone,
              prefixIcon: Icon(Icons.phone),
            ),
            CustomTextField(
              hideText: 'Nhập mật khẩu',
              controller: passwordController,
              typeInput: TypeInput.password,
              prefixIcon: Icon(Icons.lock),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                text: 'Quên mật khẩu',
                color: AppColors.backgroudButton,
              ).paddingRight(15).onTap(() {
                Get.to(() => ForgetPasswordScreen());
              }).paddingSymmetric(vertical: 10),
            ),
            CustomButton(text: 'Đăng nhập', onTap: () {}).paddingSymmetric(horizontal: 16, vertical: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 'Bạn chưa có tài khoản? '),
                CustomText(
                  text: 'Đăng kí',
                  fontWeight: FontWeight.w600,
                  color: AppColors.backgroudButton,
                ).onTap(() {
                  Get.to(() => RegisterScreen());
                })
              ],
            )
          ],
        ).paddingSymmetric(vertical: 20, horizontal: 10));
  }
}
