part of 'authentication_bloc.dart';

enum AuthenticationStatus { initial, loading, success, failure }

class AuthenticationState extends Equatable {
  const AuthenticationState.__({
    required this.status,
    this.credential,
    this.user,
    this.errorMessage,
  });

  const AuthenticationState.initial()
      : this.__(
          status: AuthenticationStatus.initial,
        );

  const AuthenticationState.loading()
      : this.__(
          status: AuthenticationStatus.loading,
        );

  const AuthenticationState.success(UserCredential credential)
      : this.__(
          status: AuthenticationStatus.success,
          credential: credential,
        );

  const AuthenticationState.failure(String? errorMessage)
      : this.__(
          status: AuthenticationStatus.success,
          errorMessage: errorMessage,
        );

  final AuthenticationStatus status;
  final UserCredential? credential;
  final User? user;
  final String? errorMessage;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    UserCredential? credential,
    User? user,
    String? errorMessage,
  }) {
    return AuthenticationState.__(
      status: status ?? this.status,
      credential: credential ?? this.credential,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, credential, user, errorMessage];
}
