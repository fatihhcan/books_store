import 'package:books_store/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../../features/auth/view/login_view.dart';
import '../../../features/auth/view/register_view.dart';
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
        return normalNavigate( const LoginView());
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate( const RegisterView());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate( const HomeView());
      case NavigationConstants.PRODUCT_DETAIL_VIEW:
        return normalNavigate( const RegisterView());
      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
