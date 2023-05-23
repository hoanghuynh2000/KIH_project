import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kih_project/utils/app_assets.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:kih_project/widget/custom_button.dart';
import 'package:kih_project/widget/custom_textfield.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool valueCheckBox = false.obs;

  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroudButton,
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.brLogin), fit: BoxFit.cover)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Image.asset(
                        AppAssets.image_logo,
                        width: 170,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildFormRegister()
                    ]).paddingAll(30).onTap(() {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }))));
      }),
    );
  }

  _buildFormRegister() {
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
            CustomTextField(
              hideText: 'Nhập lại mật khẩu',
              controller: confirmPasswordController,
              typeInput: TypeInput.confirmPassword,
              prefixIcon: Icon(Icons.lock),
            ),
            buildCheckBox(),
            CustomButton(text: 'Đăng ký', onTap: () {}).paddingSymmetric(horizontal: 16, vertical: 20),
          ],
        ).paddingSymmetric(vertical: 20, horizontal: 10));
  }

  buildCheckBox() {
    return Row(
      children: [
        Obx(() => Checkbox(
            activeColor: AppColors.backgroudButton,
            value: valueCheckBox.value,
            onChanged: (value) {
              valueCheckBox.value = value ?? false;
            })),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "Tôi đồng ý với  ",
              style: const TextStyle(fontSize: 14, color: AppColors.hintText),
              children: [
                WidgetSpan(
                    child: GestureDetector(
                  onTap: () {
                    print('Tap1');
                  },
                  child: Text("Điều khoản chính sách  ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.backgroudButton)),
                )),
                TextSpan(text: "của nhà cung cấp"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
