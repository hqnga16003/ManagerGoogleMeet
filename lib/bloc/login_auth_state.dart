part of 'login_auth_bloc.dart';

enum LoginAuthStatus { initial, loading, success, failure }

class LoginAuthState extends Equatable {
  final LoginAuthStatus status;
  final String email;
  final String password;
  final String? errorMessage;

  const LoginAuthState({
    this.status = LoginAuthStatus.initial,
    required this.email,
    required this.password,
    this.errorMessage,
  });

  LoginAuthState copyWith({
    LoginAuthStatus? status,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return LoginAuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, password, errorMessage];
}