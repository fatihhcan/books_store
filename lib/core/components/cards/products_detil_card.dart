import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsDetailCard extends StatelessWidget {
  final String? imgURL;
  final String? bookTitle;
  final String? bookAuthor;
  final String? favoriteIcon;
  final void Function()? onTapFavorite;
  const ProductsDetailCard({super.key, this.imgURL, this.bookTitle, this.bookAuthor,this.favoriteIcon, this.onTapFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      //padding: context.paddingLowAll,
      color: context.appColors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 160.h, child: Image.network(imgURL!)),
              SizedBox(width: context.normalValue * 1.5,),
              GestureDetector(onTap: onTapFavorite, child: Image.asset(favoriteIcon!)),
              SizedBox(width: context.normalValue,),
            ],
          ),
          Text(bookTitle!, style: context.textTheme.headline4!.copyWith(color: context.appColors.violet),),
          Text(bookAuthor!, style: context.textTheme.headline5!.copyWith(color: context.appColors.violet.withOpacity(0.6)),),

        ],
      ),
    );
  }
}
