part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInGoogle extends AuthenticationEvent {}

class SignInEmailPassword extends AuthenticationEvent {
  const SignInEmailPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class GetCurrentUser extends AuthenticationEvent {}

class SignOut extends AuthenticationEvent {}
