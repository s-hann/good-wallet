import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_repository/transaction_repository.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  AddTransactionBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(const AddTransactionState.initial()) {
    on<Initialize>(_initialize);
    on<AddTransaction>(_addTransaction);
  }

  final TransactionRepository _transactionRepository;

  Future<void> _initialize(
    Initialize event,
    Emitter<AddTransactionState> emit,
  ) async {
    final transactionId = event.transactionId;
    if (transactionId != null) {
      // TODO(s-hann): change UID
      final transaction = await _transactionRepository.fetchTransaction(
        uid: 'CoP5HTuW6fMu3KTl0E3scML1HgN2',
        transactionId: transactionId,
      );
      emit(
        state.copyWith(
          transaction: transaction,
        ),
      );
    }
    emit(
      AddTransactionState.initial(
        tecLabel: TextEditingController(text: state.transaction.label),
        tecCategory: TextEditingController(text: state.transaction.category),
        tecWallet: TextEditingController(text: state.transaction.wallet),
        tecAmount: TextEditingController(
          text: '${state.transaction.amount ?? ''}',
        ),
        tecDate: TextEditingController(text: '${state.transaction.date ?? ''}'),
        tecNote: TextEditingController(text: state.transaction.note),
      ),
    );
  }

  Future<void> _addTransaction(
    AddTransaction event,
    Emitter<AddTransactionState> emit,
  ) async {
    emit(state.copyWith(status: AddTransactionStatus.loading));
    try {
      await _transactionRepository.addTransaction(
        uid: AppConstant.uid,
        transaction: TransactionEntity(
          label: state.tecLabel?.text,
          type: event.type,
          category: state.tecCategory?.text,
          wallet: state.tecWallet?.text,
          amount: double.tryParse(state.tecAmount!.text),
          date: DateTime.now(),
          note: state.tecNote?.text,
        ),
      );
      emit(const AddTransactionState.success());
    } catch (e) {
      emit(AddTransactionState.failure('$e'));
    }
  }
}

abstract class AppConstant {
  static String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
}
