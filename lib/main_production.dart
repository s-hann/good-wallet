import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:good_wallet/app/app.dart';
import 'package:good_wallet/bootstrap.dart';
import 'package:good_wallet/firebase_options/firebase_options_prod.dart';
import 'package:transaction_repository/transaction_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'good-wallet',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  unawaited(
    bootstrap((firebaseAuth, firestore) async {
      final authenticationRepository = AuthenticationRepository(firebaseAuth);
      final transactionRepository =
          TransactionRepository(firebaseFirestore: firestore);
      return App(
        authenticationRepository: authenticationRepository,
        transactionRepository: transactionRepository,
      );
    }),
  );
}
