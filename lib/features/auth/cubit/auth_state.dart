part of 'auth_cubit.dart';

class AuthState {
  final bool loginLoading;
  final bool rememberMe;
  final bool registerLoading;


  const AuthState({this.loginLoading = false, this.rememberMe = false, this.registerLoading = false});
  @override
  List<Object?> get props => [loginLoading, rememberMe, registerLoading];

  AuthState copyWith({
    bool? loginLoading,
    bool? rememberMe,
    bool? registerLoading
  }) {
    return AuthState(
      loginLoading: loginLoading ?? this.loginLoading,
      rememberMe: rememberMe ?? this.rememberMe,
      registerLoading: registerLoading ?? this.registerLoading
    );
  }
}
