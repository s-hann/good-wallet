import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transaction_repository/src/entity/transaction_entity.dart';

/// {@template transaction_repository}
/// Good Wallet's Transaction Repository
/// {@endtemplate}
class TransactionRepository {
  /// {@macro transaction_repository}
  const TransactionRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  ///
  Future<void> addTransaction({
    required String uid,
    required TransactionEntity transaction,
  }) async {
    try {
      await _transactionCollection(uid: uid).add(transaction);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///
  Future<void> editTransaction({
    required String uid,
    required String transactionId,
    required TransactionEntity transaction,
  }) async {
    try {
      await _transactionCollection(uid: uid)
          .doc(transactionId)
          .set(transaction, SetOptions(merge: true));
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///
  Future<List<TransactionEntity>> fetchAllTransaction({
    required String uid,
    String? type,
  }) async {
    try {
      final transactions = <TransactionEntity>[];
      final response = await _transactionCollection(uid: uid)
          .orderBy('date', descending: true)
          .get();

      for (final item in response.docs) {
        transactions.add(item.data());
      }

      return transactions;
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///
  Future<TransactionEntity> fetchTransaction({
    required String uid,
    required String transactionId,
  }) async {
    try {
      final response =
          await _transactionCollection(uid: uid).doc(transactionId).get();
      return response.data()!;
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  CollectionReference<TransactionEntity> _transactionCollection({
    required String uid,
  }) {
    return _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('transactions')
        .withConverter<TransactionEntity>(
          fromFirestore: TransactionEntity.fromFirestore,
          toFirestore: (transaction, _) => transaction.toFirestore(),
        );
  }
}
