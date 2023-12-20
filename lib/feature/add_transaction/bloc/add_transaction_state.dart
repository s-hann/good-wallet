part of 'add_transaction_bloc.dart';

enum AddTransactionStatus { initial, loading, success, failure }

class AddTransactionState extends Equatable {
  const AddTransactionState.__({
    required this.status,
    this.transaction = const TransactionEntity(),
    this.errorMessage,
    this.tecLabel,
    this.tecCategory,
    this.tecWallet,
    this.tecAmount,
    this.tecDate,
    this.tecNote,
  });

  const AddTransactionState.initial({
    TransactionEntity? transaction,
    TextEditingController? tecLabel,
    TextEditingController? tecCategory,
    TextEditingController? tecWallet,
    TextEditingController? tecAmount,
    TextEditingController? tecDate,
    TextEditingController? tecNote,
  }) : this.__(
          status: AddTransactionStatus.initial,
          transaction: transaction ?? const TransactionEntity(),
          tecLabel: tecLabel,
          tecCategory: tecCategory,
          tecWallet: tecWallet,
          tecAmount: tecAmount,
          tecDate: tecDate,
          tecNote: tecNote,
        );

  const AddTransactionState.success()
      : this.__(
          status: AddTransactionStatus.success,
        );

  const AddTransactionState.failure(String? errorMessage)
      : this.__(
          status: AddTransactionStatus.failure,
          errorMessage: errorMessage,
        );

  final AddTransactionStatus status;
  final TransactionEntity transaction;
  final String? errorMessage;

  final TextEditingController? tecLabel;
  final TextEditingController? tecCategory;
  final TextEditingController? tecWallet;
  final TextEditingController? tecAmount;
  final TextEditingController? tecDate;
  final TextEditingController? tecNote;

  AddTransactionState copyWith({
    AddTransactionStatus? status,
    TransactionEntity? transaction,
    String? errorMessage,
    TextEditingController? tecLabel,
    TextEditingController? tecCategory,
    TextEditingController? tecWallet,
    TextEditingController? tecAmount,
    TextEditingController? tecDate,
    TextEditingController? tecNote,
  }) {
    return AddTransactionState.__(
      status: status ?? this.status,
      transaction: transaction ?? this.transaction,
      errorMessage: errorMessage ?? this.errorMessage,
      tecLabel: tecLabel ?? this.tecLabel,
      tecCategory: tecCategory ?? this.tecCategory,
      tecWallet: tecWallet ?? this.tecWallet,
      tecAmount: tecAmount ?? this.tecAmount,
      tecDate: tecDate ?? this.tecDate,
      tecNote: tecNote ?? this.tecNote,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      transaction,
      errorMessage,
      tecLabel,
      tecCategory,
      tecWallet,
      tecAmount,
      tecDate,
      tecNote,
    ];
  }
}
