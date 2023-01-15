enum NetWorkRoutes {
  TOKEN,
  REGISTER,
  CATEGORIES,
  PRODUCT,
  IMAGE,
  LIKE,
  UNLIKE
}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.TOKEN:
        return 'login';
      case NetWorkRoutes.REGISTER:
        return 'register';
      case NetWorkRoutes.CATEGORIES:
        return  'categories';
      case NetWorkRoutes.PRODUCT:
        return  'products';
      case NetWorkRoutes.IMAGE:
        return  'cover_image';
      case NetWorkRoutes.LIKE:
        return  'like';
      case NetWorkRoutes.UNLIKE:
        return  'unlike';
      default:
        throw Exception('Route not found');
    }
  }
}
