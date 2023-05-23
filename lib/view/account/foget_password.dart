import 'package:flutter/material.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:kih_project/widget/custom_button.dart';
import 'package:kih_project/widget/custom_text.dart';
import 'package:kih_project/widget/custom_textfield.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomText(
            text: 'Quên mật khẩu',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          CustomText(text: 'Vui lòng nhập số điện thoại'),
          CustomTextField(controller: phoneController, typeInput: TypeInput.phone).paddingSymmetric(horizontal: 30, vertical: 20),
          CustomButton(text: 'Tiếp tục', onTap: () {}).paddingSymmetric(vertical: 40, horizontal: 40)
        ],
      ).onTap(() {
        FocusManager.instance.primaryFocus!.unfocus();
      }),
    );
  }
}
