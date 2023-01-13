import 'package:books_store/features/auth/model/register/register_model.dart';

import '../../../core/init/network/dio_client.dart';
import '../model/login/login_model.dart';

abstract class IAuthService {
  final DioClient client;
  IAuthService(this.client);

  Future<LoginModel?> fetchAccessToken(String email, String password);
  Future<RegisterModel?> fetchRegister(String email, String name, String password);
}
