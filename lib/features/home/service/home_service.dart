import 'package:books_store/features/home/model/categories_model.dart';
import 'package:books_store/features/home/model/image_model.dart';
import 'package:books_store/features/home/model/products_model.dart';
import 'package:books_store/features/home/model/request_image_model.dart';
import 'package:dio/dio.dart';
import '../../../core/base/error/dio_exception.dart';
import '../../../core/constants/enums/network_route_enum.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../../core/init/network/dio_client.dart';
import '../../../core/utility/api.response.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  HomeService(DioClient client) : super(client);

  @override
  Future<List<CategoriesModel?>> fetchCategories() async {
    try {
      final response = await client.get(NetWorkRoutes.CATEGORIES.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      final List<CategoriesModel> result =
          ResponseParser<CategoriesModel>(response: response['category'])
              .fromList(model: CategoriesModel());

      AppStateManager.instance.categories = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<List<ProductsModel?>> fetchProducts(String categoryId) async {
    try {
      final response =
          await client.get('${NetWorkRoutes.PRODUCT.value}/$categoryId',
              options: Options(headers: {
                'Content-Type': 'application/json',
              }));
      final List<ProductsModel> result =
          ResponseParser<ProductsModel>(response: response['product'])
              .fromList(model: ProductsModel());

      AppStateManager.instance.products = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<ImageModel?> fetchImage(String fileName) async {
    try {
      final response = await client.post(NetWorkRoutes.IMAGE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: RequestImageModel(
            fileName: fileName,
          ).toJson());
      final ImageModel? result =
          ResponseParser<ImageModel>(response: response['action_product_image'])
              .fromMap(model: ImageModel());

      AppStateManager.instance.image = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
