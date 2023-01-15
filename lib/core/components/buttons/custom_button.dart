import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool buttonPrice;
  final String? price;
  const CustomButton(
      {super.key, this.onTap, required this.title, this.buttonPrice = false, this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 60.h,
        padding: context.paddingLowAll,
        decoration: BoxDecoration(
          color: context.appColors.buttonBackgroundColor,
          borderRadius: BorderRadius.all(context.lowRadius),
        ),
        child: Padding(
          padding: context.paddingLowVertical,
          child: buttonPrice
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                      price!,
                      style: context.textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      title,
                      style: context.textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Text(
                  title,
                  style: context.textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
