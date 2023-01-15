import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesCard extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final double? width;
  const CategoriesCard({super.key, this.backgroundColor, this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 42.h,
      padding: context.paddingLowAll,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(context.lowRadius),
      ),
      child: child,
    );
  }
}
