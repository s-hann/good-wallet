part of 'add_transaction_bloc.dart';

abstract class AddTransactionEvent extends Equatable {
  const AddTransactionEvent();

  @override
  List<Object?> get props => [];
}

class Initialize extends AddTransactionEvent {
  const Initialize({
    this.transactionId,
  });

  final String? transactionId;

  @override
  List<Object?> get props => [transactionId];
}

class AddTransaction extends AddTransactionEvent {
  const AddTransaction({
    required this.type,
  });

  final TransactionType type;

  @override
  List<Object?> get props => [type];
}

class EditTransaction extends AddTransactionEvent {}
