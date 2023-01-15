import 'package:books_store/core/components/cards/products_detil_card.dart';
import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:books_store/core/utility/shared_prefs.dart';
import 'package:books_store/features/product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/buttons/custom_button.dart';
import '../../../core/constants/images/image_constants.dart';

class ProductsDetailView extends StatelessWidget {
  //final int? categoryId;
  final String? productName;
  final String? imgURL;
  final String? bookTitle;
  final String? bookAuthor;
  final String? bookPrice;
  final String? bookDescription;
  final int? bookId;
  const ProductsDetailView(
      {super.key,
      this.productName,
      this.imgURL,
      this.bookTitle,
      this.bookAuthor,
      this.bookPrice,
      this.bookDescription,
      this.bookId});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductCubit>(
      cubit: ProductCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
        // cubit.fetchProducts(categoryId!.toString());
      },
      onPageBuilder: (ProductCubit cubit) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.appColors.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: context.appColors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                  onTap: () => cubit.navigatePop(),
                  child: Image.asset(ImageConstants.instance.backIcon)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  productName!,
                  style: context.textTheme.headline4!
                      .copyWith(color: context.appColors.violet),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [
                context.sizedBoxNormalVertical,
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return productsDetailCard(state, cubit);
                  },
                ),
                textSummary(context),
                context.sizedBoxLowVertical,
                textDescription(context),
                context.sizedBoxNormalVertical,
                textPrice(context)
              ],
            ),
          )),
    );
  }

  Padding textPrice(BuildContext context) {
    return Padding(
                padding: context.paddingLowHorizontal,
                child: CustomButton(
                    buttonPrice: true,
                    price: "${bookPrice!} \$",
                    title: TextConstants.buyNow),
              );
  }

  Padding textDescription(BuildContext context) {
    return Padding(
                padding: context.paddingLowHorizontal,
                child: Text(
                  bookDescription!,
                  style: context.textTheme.headline5!.copyWith(
                      color: context.appColors.violet.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              );
  }

  Padding textSummary(BuildContext context) {
    return Padding(
                padding: context.paddingLowHorizontal,
                child: Text(
                  TextConstants.summary,
                  style: context.textTheme.headline4!
                      .copyWith(color: context.appColors.violet),
                ),
              );
  }

  ProductsDetailCard productsDetailCard(ProductState state, ProductCubit cubit) {
    return ProductsDetailCard(
                    imgURL: imgURL,
                    bookTitle: bookTitle,
                    bookAuthor: bookAuthor,
                    favoriteIcon: state.favoriteButton
                        ? ImageConstants.instance.favoriteFillIcon
                        : ImageConstants.instance.favoriteIcon,
                    onTapFavorite: () {
                      cubit.favoriteButton(state.favoriteButton);
                      cubit.favoriteToggleFetch(
                          SharedPrefs.getUserId, bookId);
                    },
                  );
  }
}
