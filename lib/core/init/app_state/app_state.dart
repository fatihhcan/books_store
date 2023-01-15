
import 'package:books_store/features/home/model/categories_model.dart';
import 'package:books_store/features/home/model/image_model.dart';
import 'package:books_store/features/home/model/products_model.dart';

String apiAccessToken = '';
class AppStateManager {
  static AppStateManager? _instance;
  static AppStateManager get instance {
    return _instance ??= AppStateManager.init();
  }

  String accessToken = apiAccessToken;

  List<CategoriesModel> categories = [];
  List<ProductsModel> products = [];
  ImageModel? image;


  AppStateManager.init();
}
