import 'dart:async';
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
  late List<ProductsModel> productsList = [];
  late List<ImageModel> imageProducts = [];

  @override
  void init() async {
    initService();
  }

  void initService() {
    homeService = HomeService(dioManager.BookStoreClient);
  }

  void productsLoading(bool loading) {
    emit(state.copyWith(productsLoading: loading));
  }

  void categoriesLoading(bool loading) {
    emit(state.copyWith(categoriesLoading: loading));
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

  @override
  void setContext(BuildContext context) => this.context = context;
}
