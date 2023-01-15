import 'package:books_store/features/home/model/categories_model.dart';
import 'package:books_store/features/home/model/image_model.dart';
import 'package:books_store/features/home/model/products_model.dart';

import '../../../core/init/network/dio_client.dart';


abstract class IHomeService {
  final DioClient client;
  IHomeService(this.client);

  Future<List<CategoriesModel?>>  fetchCategories();
  Future<List<ProductsModel?>>  fetchProducts(String categoryId);
  Future<ImageModel?>  fetchImage(String fileName);
}
