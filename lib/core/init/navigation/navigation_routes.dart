import 'package:books_store/core/init/navigation/navigate_exception.dart';
import 'package:books_store/core/utility/arguments_product.dart';
import 'package:books_store/features/home/view/home_view.dart';
import 'package:books_store/features/product/view/products_view.dart';
import 'package:flutter/material.dart';
import '../../../features/auth/view/login_view.dart';
import '../../../features/auth/view/register_view.dart';
import '../../../features/home/model/image_model.dart';
import '../../../features/home/model/products_model.dart';
import '../../../features/splash/view/splah_view.dart';
import '../../components/cards/not_found_navigation.dart';
import '../../constants/enums/navigation_routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const HomeView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(const RegisterView());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(const HomeView());
      case NavigationConstants.PRODUCTS_VIEW:
       final ProductsArguments argsProducts =
            args.arguments as ProductsArguments;
               return MaterialPageRoute(
            builder: (_) => ProductsView(categoryName: argsProducts.categoryName, categoryId: argsProducts.categoryId));
    
      case NavigationConstants.PRODUCT_DETAIL_VIEW:
        return normalNavigate(const RegisterView());
      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
