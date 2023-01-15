import 'package:books_store/core/components/cards/categories_card.dart';
import 'package:books_store/core/components/cards/products_card.dart';
import 'package:books_store/core/components/cards/search_card.dart';
import 'package:books_store/core/constants/images/image_constants.dart';
import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:books_store/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/view/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeCubit>(
      cubit: HomeCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (HomeCubit cubit) => Scaffold(
          backgroundColor: context.appColors.scaffoldBackgroundColor,
          appBar: buildAppbar(context),
          body: Column(
            children: [
              context.sizedBoxNormalVertical,
              buildCategories(cubit),
              context.sizedBoxLowVertical,
              buildSearch(context),
              context.sizedBoxNormalVertical,
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        height: 600.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return state.categoriesLoading
                                ? const LinearProgressIndicator()
                                : ListView.separated(
                                    itemCount: cubit.categoriesList.length,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) =>context.sizedBoxLowHorizontal,
                                    itemBuilder: ((context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          context.sizedBoxNormalVertical,
                                          Padding(
                                            padding: const EdgeInsets.only(right:8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  cubit.categoriesList[index].name!,
                                                  style: context.textTheme.headline5!
                                                      .copyWith(color: Colors.black),
                                                  textAlign: TextAlign.start,
                                                ),
                                                GestureDetector(
                                                  onTap: () => cubit.navigateProducts(cubit.categoriesList[index].id, cubit.categoriesList[index].name, context), 
                                                  child: Text(TextConstants.viewAll, style: context.textTheme.subtitle1!.copyWith(color: context.appColors.burntSienna),)
                                                  ),
                                              ],
                                            ),
                                          ),
                                          context.sizedBoxNormalVertical,
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: SizedBox(
                                              height: 140.h,
                                              child: BlocBuilder<HomeCubit,
                                                  HomeState>(
                                                builder: (context, state) {
                                                  return state.productsLoading
                                                      ? const LinearProgressIndicator()
                                                      : ListView.separated(
                                                          itemCount: cubit.productMatchId(cubit.categoriesList[index].id!).length,
                                                          scrollDirection:Axis.horizontal,
                                                          separatorBuilder:(context,index) =>context.sizedBoxLowHorizontal,
                                                          itemBuilder: ((context,indexProduct) {
                                                            
                                                            return ProductsCard(
                                                              imgURL: cubit.productMatchImage(cubit.categoriesList[index].id!)[indexProduct].url,
                                                              bookTitle: cubit.productMatchId(cubit.categoriesList[index].id!)[indexProduct].name,
                                                              bookAuthor: cubit.productMatchId(cubit.categoriesList[index].id!)[indexProduct].author,
                                                              bookPrice: cubit.productMatchId(cubit.categoriesList[index].id!)[indexProduct].price,
                                                            );
                                                          }));
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
          elevation: 1,
          backgroundColor: context.appColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(ImageConstants.instance.homeLogo),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                TextConstants.catalog,
                style: context.textTheme.headline4!
                    .copyWith(color: context.appColors.violet),
              ),
            )
          ],
        );
  }

  Padding buildSearch(BuildContext context) {
    return Padding(
              padding: context.paddingLowHorizontal,
              child: const SearchCard(),
            );
  }

  Padding buildCategories(HomeCubit cubit) {
    return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 40.h,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.categoriesLoading
                        ? const LinearProgressIndicator()
                        : ListView.separated(
                            itemCount: cubit.categoriesList.length,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            separatorBuilder: (context, index) =>context.sizedBoxLowHorizontal,
                            itemBuilder: ((context, index) {
                              return CategoriesCard(
                                width: cubit.categoriesList[index].name!.length <= 6
                                    ? 71.w
                                    : 126.w,
                                backgroundColor:  cubit.categoriesList[index].name! == 'hello' ? context.appColors.royalBlue : context.appColors.titanWhite,
                                child: Text(
                                  cubit.categoriesList[index].name! == 'hello' ? 'All' : cubit.categoriesList[index].name!,
                                  style: context.textTheme.headline5!.copyWith(color:   cubit.categoriesList[index].name! == 'hello' ? context.appColors.white : context.appColors.violet.withOpacity(0.4),),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }));
                  },
                ),
              ),
            );
  }
}
