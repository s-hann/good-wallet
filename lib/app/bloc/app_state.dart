part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState.__({
    this.status,
    this.user,
  });

  const AppState.authenticated(User? user)
      : this.__(
          status: AppStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this.__(
          status: AppStatus.unauthenticated,
        );

  final AppStatus? status;
  final User? user;
  
  @override
  List<Object?> get props => [status, user];
}
