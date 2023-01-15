import 'dart:async';
import 'package:books_store/core/utility/arguments_product.dart';
import 'package:books_store/features/product/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/constants/enums/navigation_routes.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../home/model/image_model.dart';
import '../../home/model/products_model.dart';
import '../../home/service/home_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> with BaseCubit {
  ProductCubit() : super(const ProductState());
  late HomeService homeService;
  late ProductService productService;
  late List<ProductsModel> productsList = [];
  late List<ImageModel> imageProducts = [];

  @override
  void init() async {
    initService();
  }

  void initService() {
    homeService = HomeService(dioManager.BookStoreClient);
    productService = ProductService(dioManager.BookStoreClient);
  }

  void productsLoading(bool loading) {
    emit(state.copyWith(productsLoading: loading));
  }

  void likeLoading(bool loading) {
    emit(state.copyWith(likeLoading: loading));
  }

  void unLikeLoading(bool loading) {
    emit(state.copyWith(unLikeLoading: loading));
  }

  Future<void> fetchProducts(String? categoryId) async {
    productsLoading(true);
    await homeService.fetchProducts(categoryId!);
    productsList = AppStateManager.instance.products;
    for (var i = 0; i < productsList.length; i++) {
      await homeService.fetchImage(productsList[i].cover!);
      imageProducts.add(AppStateManager.instance.image!);
    }
    productsLoading(false);
  }

  navigatePop() {
    navigation.pop();
  }

  navigateDetailProduct(
      String? productName,
      String? imgURL,
      String? bookTitle,
      String? bookAuthor,
      String? bookPrice,
      String? bookDescription,
      BuildContext context) {
    Navigator.of(context).pushNamed(NavigationConstants.PRODUCT_DETAIL_VIEW,
        arguments: ProductDetailArguments(
            productName: productName,
            imgURL: imgURL,
            bookTitle: bookTitle,
            bookAuthor: bookAuthor,
            bookPrice: bookPrice,
            bookDescription: bookDescription));
  }

  Future<void> fetchLike(int? userId, int? productId) async {
    likeLoading(true);
    await productService.fetchLike(userId, productId);
    likeLoading(false);
  }

  Future<void> fetchUnLike(int? userId, int? productId) async {
    unLikeLoading(true);
    await productService.fetchUnLike(userId, productId);
    unLikeLoading(false);
  }

  favoriteToggleFetch(int? userId, int? productId) async {
    if (state.favoriteButton) {
     await fetchLike(userId, productId);
    } else {
      await  fetchUnLike(userId, productId);
    }
  }

  favoriteButton(bool ischeck) {
    ischeck = !ischeck;
    emit(state.copyWith(favoriteButton: ischeck));
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
