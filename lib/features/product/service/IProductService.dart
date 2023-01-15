import 'package:books_store/features/product/model/request_like_model.dart';

import '../../../core/init/network/dio_client.dart';


abstract class IProductService {
  final DioClient client;
  IProductService(this.client);

  Future<RequestLikeModel?>  fetchLike(int userId, int productId);
  Future<RequestLikeModel?>  fetchUnLike(int userId, int productId);

}
