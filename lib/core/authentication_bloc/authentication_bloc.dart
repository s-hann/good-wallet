import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.initial()) {
    on<SignInGoogle>(_signInGoogle);
    on<GetCurrentUser>(_getCurrentUser);
    on<SignOut>(_signOut);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _signInGoogle(
    SignInGoogle event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());
    try {
      final result = await _authenticationRepository.signInGoogle();
      emit(AuthenticationState.success(result));
    } catch (e) {
      emit(AuthenticationState.failure('$e'));
    }
  }

  Future<void> _getCurrentUser(
    GetCurrentUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final user = await _authenticationRepository.getCurrentUser();
      emit(state.copyWith(user: user));
    } catch (_) {}
  }

  Future<void> _signOut(
    SignOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationRepository.signOutGoogle();
    } catch (_) {}
  }
}
