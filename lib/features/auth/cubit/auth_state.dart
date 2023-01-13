part of 'auth_cubit.dart';

class AuthState {
  final bool loginLoading;
  final bool rememberMe;

  const AuthState({this.loginLoading = false, this.rememberMe = false});
  @override
  List<Object?> get props => [loginLoading, rememberMe];

  AuthState copyWith({
    bool? loginLoading,
    bool? rememberMe
  }) {
    return AuthState(
      loginLoading: loginLoading ?? this.loginLoading,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
