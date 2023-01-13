enum NetWorkRoutes {
  TOKEN,
  REGISTER,
  HOME,
  PRODUCT
}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.TOKEN:
        return 'login';
      case NetWorkRoutes.REGISTER:
        return 'register';
      case NetWorkRoutes.HOME:
        return  '';

      default:
        throw Exception('Route not found');
    }
  }
}
