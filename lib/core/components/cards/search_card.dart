import 'package:books_store/core/constants/images/image_constants.dart';
import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCard extends StatelessWidget {

  const SearchCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.w,
        height: 50.h,
        padding: context.paddingLowAll,
        decoration: BoxDecoration(
          color: context.appColors.titanWhite,
          borderRadius: BorderRadius.all(context.lowRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(ImageConstants.instance.searchIcon),
            context.sizedBoxLowHorizontal,
            Text(TextConstants.search, style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w400, color: context.appColors.violet),),
            SizedBox(width: context.mediumValue * 8.5,),
            Image.asset(ImageConstants.instance.filterIcon),
          ],
        ),);
  }
}
