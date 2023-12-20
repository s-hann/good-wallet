import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

/// {@template authentication_repository}
/// Good Wallet's Authentication Repository
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  const AuthenticationRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  /// sign in with Google
  Future<UserCredential> signInGoogle() async {
    try {
      final user = await _googleSignIn.signIn();

      // get user authentication
      final auth = await user?.authentication;

      // set credential
      final credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );

      // return UserCredential
      return await _firebaseAuth.signInWithCredential(credential);
    } on Exception catch (error, stackTrace) {
      throw AuthenticationException(error, stackTrace);
    }
  }

  /// sign out from google account
  Future<void> signOutGoogle() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception catch (error, stackTrace) {
      throw AuthenticationException(error, stackTrace);
    }
  }

  /// get current user
  Future<User?> getCurrentUser() async {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  /// get user
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().asyncMap(_handleAuthStateChanged);
  }

  Future<User?> _handleAuthStateChanged(User? auth) async {
    return auth;
  }
}

/// {@template authentication_exception}
/// Exception for Good Wallet's Authentication
/// {@endtemplate}
class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error, this.stackTrace);

  /// the error that was caught
  final Object error;

  /// the stack trace associated with the [error]
  final StackTrace stackTrace;
}
