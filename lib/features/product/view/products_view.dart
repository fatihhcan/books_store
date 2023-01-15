import 'package:books_store/core/components/cards/search_card.dart';
import 'package:books_store/core/components/cards/vertical_product_card.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:books_store/features/product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/images/image_constants.dart';


class ProductsView extends StatelessWidget {
  final int? categoryId;
  final String? categoryName;
  const ProductsView({super.key, this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductCubit>(
      cubit: ProductCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
        cubit.fetchProducts(categoryId!.toString());
      },
      onPageBuilder: (ProductCubit cubit) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.appColors.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: context.appColors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(onTap: ()=> cubit.navigatePop(), child: Image.asset(ImageConstants.instance.backIcon)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  categoryName!,
                  style: context.textTheme.headline4!
                      .copyWith(color: context.appColors.violet),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                context.sizedBoxNormalVertical,
                const SearchCard(),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return state.productsLoading ? const CircularProgressIndicator() : Expanded(
                                  child: Padding(
                                    padding: context.paddingLowAll,
                                    child: GridView.builder(
                                    gridDelegate:   const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                       crossAxisSpacing: 20,
                                       childAspectRatio:1/1.6,
                                    crossAxisCount: 2),
                                    itemCount: cubit.productsList.length,
                                    itemBuilder: (BuildContext context, index) {
                                    return VerticalProductCard(
                                    imgURL: cubit.imageProducts[index].url,
                                    bookTitle: cubit.productsList[index].name,
                                    bookAuthor: cubit.productsList[index].author,
                                    bookPrice: cubit.productsList[index].price,
                                    );              
                                    }),
                                  ),
                                );
                  },
                ), 
            ],


            ),
          )),
    );
  }
}
