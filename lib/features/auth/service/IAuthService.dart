import '../../../core/init/network/dio_client.dart';
import '../model/login/login_model.dart';

abstract class IAuthService {
  final DioClient client;
  IAuthService(this.client);

  Future<LoginModel?> fetchAccessToken(String email, String password);
}
