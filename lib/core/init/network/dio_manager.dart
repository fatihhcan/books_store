// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';

import '../../base/error/dio_exception.dart';
import '../../constants/app/app_constant.dart';
import '../../constants/enums/authorization_enums.dart';
import '../app_state/app_state.dart';
import 'dio_client.dart';

class DioManager {
  static DioManager? _instance;
  static DioManager get instance {
    return _instance ??= DioManager.init();
  }

  DioManager.init();

  // DioClient BookStoreClient = DioClient(baseUrl: AppConstants.BASE_URL);
  DioClient BookStoreClient = DioClient(
      baseUrl: AppConstants.BASE_URL,
      interceptorsWrapper:
          InterceptorsWrapper(onRequest: (options, handler) async {
        String accessToken = AppStateManager.instance.accessToken;
        if (accessToken.isNotEmpty) {
          options.headers.putIfAbsent(
              AuthorizationConstants.authorization.value(),
              () => AuthorizationConstants.jwt
                  .value(accessToken: accessToken));
        }
        options.contentType = Headers.jsonContentType;
        return handler.next(options);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioError e, handler) {
        throw DioException.fromDioError(e);
      }));

  DioClient FilterNetworkClient = DioClient(
      baseUrl: AppConstants.BASE_URL,
      );
}
