import 'package:books_store/core/init/app_state/app_state.dart';
import 'package:books_store/features/home/model/categories_model.dart';
import 'package:books_store/features/home/model/image_model.dart';
import 'package:books_store/features/home/model/products_model.dart';
import 'package:books_store/features/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/cubit/base_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseCubit {
  HomeCubit() : super(const HomeState());

  late HomeService homeService;
  late List<CategoriesModel> categoriesList = [];
  late List<ProductsModel> productsBestSeller = [];
  late List<ProductsModel> productsClassics = [];
  late List<ProductsModel> productsChildren = [];
  late List<ProductsModel> productsPhilosopyh = [];
  late List<ProductsModel> productsHello = [];
  late List<ImageModel> imageModel1 = [];
  late List<ImageModel> imageModel2 = [];
  late List<ImageModel> imageModel3 = [];
  late List<ImageModel> imageModel4 = [];
  late List<ImageModel> imageModel5 = [];
  // 1 -> best seller 2 -> classics 3 -> children 4 -> philosopyh 5 -> hello
  List<String> categoriesId = ['1', '2', '3', '4', '6'];
  @override
  void init() {
    initService();
  }

  void initService() {
    homeService = HomeService(dioManager.BookStoreClient);
    fetchCategories();
    fetchProducts(); 
  }

  void categoriesLoading(bool loading) {
    emit(state.copyWith(categoriesLoading: loading));
  }

  void productsLoading(bool loading) {
    emit(state.copyWith(productsLoading: loading));
  }

  void imageLoading(bool loading) {
    emit(state.copyWith(imageLoading: loading));
  }

  Future<void> fetchCategories() async {
    categoriesLoading(true);
    await homeService.fetchCategories();
    categoriesList = AppStateManager.instance.categories;
    categoriesLoading(false);
  }

  Future<void> fetchProducts() async {
    productsLoading(true);
    await homeService.fetchProducts(categoriesId[0]);
    productsBestSeller = AppStateManager.instance.products;
    for (var i = 0; i < productsBestSeller.length; i++) {
      await homeService.fetchImage(productsBestSeller[i].cover!);
      imageModel1.add( AppStateManager.instance.image!);
    }

    await homeService.fetchProducts(categoriesId[1]);
    productsClassics = AppStateManager.instance.products;
    for (var i = 0; i < productsClassics.length; i++) {
      await homeService.fetchImage(productsClassics[i].cover!);
          imageModel2.add( AppStateManager.instance.image!);
    }
    await homeService.fetchProducts(categoriesId[2]);
    productsChildren = AppStateManager.instance.products;
      for (var i = 0; i < productsChildren.length; i++) {
      await homeService.fetchImage(productsChildren[i].cover!);
           imageModel3.add( AppStateManager.instance.image!);
    }

    await homeService.fetchProducts(categoriesId[3]);
    productsPhilosopyh = AppStateManager.instance.products;
      for (var i = 0; i < productsPhilosopyh.length; i++) {
      await homeService.fetchImage(productsPhilosopyh[i].cover!);
         imageModel4.add( AppStateManager.instance.image!);
    }


    await homeService.fetchProducts(categoriesId[4]);
    productsHello = AppStateManager.instance.products;
      for (var i = 0; i < productsHello.length; i++) {
      await homeService.fetchImage(productsHello[i].cover!);
           imageModel5.add( AppStateManager.instance.image!);
    }
    productsLoading(false);
  }

  productMatchId(int categoryId) {
    if (categoryId == 1) {
      return productsBestSeller;
    } else if (categoryId == 2) {
      return productsClassics;
    } else if (categoryId == 3) {
      return productsChildren;
    } else if (categoryId == 4) {
      return productsPhilosopyh;
    } else {
      return productsHello;
    }
  }

  productMatchImage(int categoryId) {
    if (categoryId == 1) {
      
      return imageModel1;
    } else if (categoryId == 2) {
      return imageModel2;
    } else if (categoryId == 3) {
      return imageModel3;
    } else if (categoryId == 4) {
      return imageModel4;
    } else {
      return imageModel4;
    }
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
