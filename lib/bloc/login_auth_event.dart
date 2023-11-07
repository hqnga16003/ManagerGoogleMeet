part of 'login_auth_bloc.dart';

import 'package:equatable/equatable.dart';

class LoginAuthEvent extends Equatable {
  const LoginAuthEvent();

  @override
  List<Object> get props => [];
}

class LoginAuthStarted extends LoginAuthEvent {
  const LoginAuthStarted();
}

class LoginAuthEmailChanged extends LoginAuthEvent {
  const LoginAuthEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginAuthPasswordChanged extends LoginAuthEvent {
  const LoginAuthPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginAuthSubmitted extends LoginAuthEvent {
  const LoginAuthSubmitted();
}
