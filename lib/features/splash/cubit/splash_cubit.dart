import 'dart:async';

import 'package:books_store/core/utility/shared_prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/constants/enums/navigation_routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with BaseCubit {
  SplashCubit() : super(SplashInitial());
  Timer? dialogTimer;

  @override
  void init() async {
    routeDelayLogin();
  }

  Future<void> routeDelayLogin() async {
    Future.delayed(const Duration(seconds: 3), () {
      //route
      if (SharedPrefs.getToken.isNotEmpty) {
         navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
      }else{
         navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
      }
     
      
    });
  }

  navigationLogin() {
    navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
