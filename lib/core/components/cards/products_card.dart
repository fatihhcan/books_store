import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCard extends StatelessWidget {
  final String? imgURL;
  final String? bookTitle;
  final String? bookAuthor;
  final double? bookPrice;

  const ProductsCard({super.key, this.imgURL, this.bookTitle, this.bookAuthor, this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      height: 140.h,
      padding: context.paddingLowAll,
      decoration: BoxDecoration(
        color: context.appColors.titanWhite,
        borderRadius: BorderRadius.all(context.lowRadius),
      ),
      child: Row(
        children: [
          Expanded(child: SizedBox(width:100.h,child: Image.network(imgURL!))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(bookTitle!, style: context.textTheme.subtitle1!.copyWith(color: context.appColors.violet, fontWeight: FontWeight.w600),),
                Text(bookAuthor!, style: context.textTheme.bodyText1!.copyWith(color: context.appColors.violet.withOpacity(0.6)),),
                Text("${bookPrice!} \$" , style: context.textTheme.headline5!.copyWith(color: context.appColors.royalBlue, fontWeight: FontWeight.w700),),
              ],
            ),
          )
        ],
      ),
    );
  }
}