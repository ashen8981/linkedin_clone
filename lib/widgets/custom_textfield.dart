import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class commonTextField extends StatelessWidget {
  final bool isPassword;
  final InputDecoration decoration;
  final Color? suffixIconColor;
  final TextFieldType textFieldType;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function()? onSuffixTap;
  final Function(String)? onChanged;

  const commonTextField({
    Key? key,
    required this.isPassword,
    required this.decoration,
    this.suffixIconColor,
    required this.textFieldType,
    required this.controller,
    required this.keyboardType,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      decoration: decoration.copyWith(
        suffixIcon: suffixIcon, // Use the provided suffix icon
      ),
      suffixIconColor: suffixIconColor,
      textFieldType: textFieldType,
      isPassword: isPassword,
      keyboardType: keyboardType,
      controller: controller,
    );
  }
}

InputDecoration inputDecoration(
    {IconData? prefixIcon,
      String? hint,
      Color? bgColor,
      Color? borderColor,
      EdgeInsets? padding,
      Widget? suffixIcon,}) {
  return InputDecoration(
    contentPadding:
    padding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: borderColor ?? bCustomColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? wCustomColor.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
    prefixIcon != null ? Icon(prefixIcon, color: greyB) : null,
    suffixIcon: suffixIcon,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}
