import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VerticalProductCard extends StatelessWidget {
  final String? imgURL;
  final String? bookTitle;
  final String? bookAuthor;
  final double? bookPrice;
  const VerticalProductCard({super.key, this.imgURL, this.bookTitle, this.bookAuthor, this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 170.w,
    height: 284.h,
    decoration: BoxDecoration(
      color: context.appColors.titanWhite,
      borderRadius: BorderRadius.all(context.lowRadius),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imgURL!, height: 240.h,),
        Padding(
          padding: context.paddingLowHorizontal,
          child: Text(bookTitle!, style: context.textTheme.bodyText1!.copyWith(color: context.appColors.violet, fontWeight: FontWeight.w600),),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bookAuthor!, style: context.textTheme.subtitle2!.copyWith(color: context.appColors.violet.withOpacity(0.6)),),
              Text("${bookPrice!} \$", style: context.textTheme.subtitle1!.copyWith(color: context.appColors.royalBlue, fontWeight: FontWeight.w700),),
            ],
          ),
        )
       
        
      ],
    ),
   );
 }
}
//