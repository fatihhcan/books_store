import 'package:books_store/features/auth/model/login/request_login_model.dart';
import 'package:books_store/features/auth/model/register/register_model.dart';
import 'package:books_store/features/auth/model/register/request_register_model.dart';
import 'package:dio/dio.dart';

import '../../../core/base/error/dio_exception.dart';
import '../../../core/constants/enums/network_route_enum.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../../core/init/network/dio_client.dart';
import '../../../core/utility/api.response.dart';
import '../model/login/login_model.dart';
import 'IAuthService.dart';

class AuthService extends IAuthService {
  AuthService(DioClient client) : super(client);

  @override
  Future<LoginModel?> fetchAccessToken(String email, String password) async {
    try {
      final response = await client.post(NetWorkRoutes.TOKEN.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: RequestLoginModel(
                  email: email,
                  password: password)
              .toJson());
      final LoginModel? result =
          ResponseParser<LoginModel>(response: response['action_login']).fromMap(model: LoginModel());
      //save token into appstate
      
      AppStateManager.instance.accessToken = result?.token ?? '';
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<RegisterModel?> fetchRegister(String email, String name, String password) async {
    try {
      final response = await client.post(NetWorkRoutes.REGISTER.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: RequestRegisterModel(
                  email: email,
                  name: name,
                  password: password)
              .toJson());
      final RegisterModel? result =
          ResponseParser<RegisterModel>(response: response['action_register']).fromMap(model: RegisterModel());
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
      
    }
  }
}