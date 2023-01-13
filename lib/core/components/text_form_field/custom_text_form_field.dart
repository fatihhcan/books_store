import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.inputFormatters,
      this.keyboardType,
      required this.controller,
      required this.validator,
      required this.autovalidateMode,
      this.maxLength,
      this.obscureText = false
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: context.appColors.titanWhite,
        borderRadius: BorderRadius.all(context.lowRadius),
      ),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: validator,
        maxLength: maxLength,
        obscureText: obscureText,
        style: context.textTheme.headline5!.copyWith(
            color: context.appColors.violet, fontWeight: FontWeight.w400),
        cursorColor: context.appColors.violet,
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: context.paddingLowAll,
            hintStyle: context.textTheme.headline5!.copyWith(
                color: Colors.grey.withOpacity(0.4),
                fontWeight: FontWeight.w400),
            hintText: hintText),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
