import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kih_project/utils/app_color.dart';

enum TypeInput { name, phone, email, idCard, password, confirmPassword, number, text, multiline }

const EMOJI_REGEXP = r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
const MAX_LENGTH_CHARACTER = 50;
const String EMAIL_REGEXP = r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TypeInput typeInput;
  final String labelText;
  final bool readOnly;
  final double paddingVer;
  final double paddingHoz;
  final double paddingVerContent;
  final double paddingHozContent;

  final FormFieldValidator<String?>? validator;
  final String initVal;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final bool? obscureText;
  final int maxLine;
  final bool number;
  final Widget? prefixIcon;
  final String hideText;
  final ValueChanged<String>? onChanged;
  final Color colorEnableBoder;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.typeInput,
    this.labelText = '',
    this.maxLine = 1,
    this.initVal = '',
    this.number = false,
    this.colorEnableBoder = AppColors.grey,
    this.readOnly = false,
    this.hideText = '',
    this.paddingHoz = 10,
    this.paddingVer = 10,
    this.paddingHozContent = 10,
    this.paddingVerContent = 10,
    this.validator,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.obscureText,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;

  TextInputType textTypeInput(TypeInput typeInput) {
    switch (typeInput) {
      case TypeInput.name:
        return TextInputType.text;
      case TypeInput.number:
        return TextInputType.number;
      case TypeInput.phone:
        return TextInputType.phone;
      case TypeInput.email:
        return TextInputType.emailAddress;
      case TypeInput.password:
        return TextInputType.visiblePassword;
      case TypeInput.confirmPassword:
        return TextInputType.visiblePassword;
      case TypeInput.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: widget.paddingVer.h, horizontal: widget.paddingHoz),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChanged,
            maxLines: widget.maxLine,
            cursorColor: Colors.grey.shade700,
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.textAlign,
            readOnly: widget.readOnly,
            inputFormatters: [
              widget.number ? LengthLimitingTextInputFormatter(15) : LengthLimitingTextInputFormatter(355),
              if (widget.number) ...{FilteringTextInputFormatter.digitsOnly}
            ],
            obscureText: widget.obscureText ?? widget.typeInput == TypeInput.password || widget.typeInput == TypeInput.confirmPassword ? !_passwordVisible : false,
            keyboardType: textTypeInput(widget.typeInput),
            style: TextStyle(color: AppColors.black, fontSize: 15.sp),
            controller: widget.controller,
            onTap: widget.onTap,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(vertical: widget.paddingVerContent.w, horizontal: widget.paddingHozContent.w),
                errorStyle: TextStyle(color: AppColors.error, fontSize: 12.sp),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon ??
                    (widget.typeInput == TypeInput.password || widget.typeInput == TypeInput.confirmPassword
                        ? IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )
                        : null),
                focusColor: AppColors.primaryColor,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.backgroudButton)),
                errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.error)),
                focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.error)),
                labelText: widget.labelText == '' ? null : widget.labelText,
                alignLabelWithHint: true,
                hintText: widget.hideText,
                hintStyle: const TextStyle(color: AppColors.grey),
                labelStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
            validator: widget.validator,
          )),
    );
  }
}
