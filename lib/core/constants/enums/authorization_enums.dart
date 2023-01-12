enum AuthorizationConstants { authorization, jwt }
extension AuthorizationConstantValues on AuthorizationConstants {
  
  String value({String? accessToken = ''}) {
    switch (this) {
      case AuthorizationConstants.authorization:
        return 'Authorization';
      case AuthorizationConstants.jwt:
        return 'JWT $accessToken';
      default:
        throw Exception('Argument not found');
    }
  }
}