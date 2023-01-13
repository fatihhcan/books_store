import 'package:books_store/core/components/alert_dialog/custom_alert_dialog.dart';
import 'package:books_store/core/constants/enums/navigation_routes.dart';
import 'package:books_store/core/utility/shared_prefs.dart';
import 'package:books_store/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/init/app_state/app_state.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with BaseCubit {
  AuthCubit() : super(const AuthState());
  TextEditingController? controllerEmail;
  TextEditingController? controllerPassword;
  TextEditingController? controllerName;
  late AuthService authService;

  @override
  void init() {
    initService();
  }

  void initService() {
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerName = TextEditingController();
    authService = AuthService(dioManager.BookStoreClient);
  }

  void loginLoading(bool loading) {
    emit(state.copyWith(loginLoading: loading));
  }

  Future<void> login(String email, String password) async {
    loginLoading(true);
    if (email.isNotEmpty && password.isNotEmpty) {
      await authService.fetchAccessToken(email, password);
      await navigationHome();
    } else {
      customShowAlertDialog(context!);
    }

    loginLoading(false);
  }

  navigationHome() {
    if (AppStateManager.instance.accessToken.isNotEmpty) {
      navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
      if (state.rememberMe) {
        SharedPrefs.setToken(AppStateManager.instance.accessToken);
      }
    } else {
      navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
    }
  }

  navigationRegister() {
    navigation.navigateToPage(path: NavigationConstants.REGISTER_VIEW);
  }

  rememberMeCheckBox(bool ischeck) {
    emit(state.copyWith(rememberMe: ischeck));
  }

  // Register
  void registerLoading(bool loading) {
    emit(state.copyWith(registerLoading: loading));
  }

  Future<void> register(String email, String name, String password) async {
    registerLoading(true);
    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      await authService.fetchRegister(email, name, password);
      navigationRegisterToHome();
    } else {
      customShowAlertDialog(context!);
    }
    registerLoading(false);
  }

  navigationLogin() {
    navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }

  navigationRegisterToHome() {
    navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
