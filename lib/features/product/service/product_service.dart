import 'package:books_store/features/product/model/request_like_model.dart';
import 'package:dio/dio.dart';
import '../../../core/base/error/dio_exception.dart';
import '../../../core/constants/enums/network_route_enum.dart';
import '../../../core/init/network/dio_client.dart';
import '../../../core/utility/api.response.dart';
import 'IProductService.dart';

class ProductService extends IProductService {
  ProductService(DioClient client) : super(client);

  @override
  Future<RequestLikeModel?> fetchLike(int? userId, int? productId) async {
    try {
      final response = await client.post(NetWorkRoutes.LIKE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data:  RequestLikeModel(
                  userId: userId,
                  productId: productId)
              .toJson()
          );
      final RequestLikeModel? result =
          ResponseParser<RequestLikeModel>(response: response).fromMap(model: RequestLikeModel());
      
      //AppStateManager.instance.image = result ;
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<RequestLikeModel?> fetchUnLike(int? userId, int? productId) async {
    try {
      final response = await client.post(NetWorkRoutes.UNLIKE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data:  RequestLikeModel(
                  userId: userId,
                  productId: productId)
              .toJson()
          );
      final RequestLikeModel? result =
          ResponseParser<RequestLikeModel>(response: response).fromMap(model: RequestLikeModel());
      
      //AppStateManager.instance.image = result ;
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}