enum NetWorkRoutes {
  TOKEN,
  HOME,
  PRODUCT
}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.TOKEN:
        return 'login';

      case NetWorkRoutes.HOME:
        return  'api/Announcement/v1/Current';

      default:
        throw Exception('Route not found');
    }
  }
}
