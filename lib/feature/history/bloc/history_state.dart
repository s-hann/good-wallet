part of 'history_bloc.dart';

enum HistoryViewType { table, chart }

enum HistoryStatus { initial, loading, success, failure }

class HistoryState extends Equatable {
  const HistoryState.__({
    this.historyView = HistoryViewType.table,
    this.historyStatus = HistoryStatus.initial,
    this.histories = const <TransactionEntity>[],
    this.errorMessage,
  });

  const HistoryState.initial() : this.__();

const HistoryState.loading() : this.__(historyStatus: HistoryStatus.loading);

  const HistoryState.success({
    required List<TransactionEntity> histories,
  }) : this.__(
          historyStatus: HistoryStatus.success,
          histories: histories,
        );

  const HistoryState.failure({String? errorMessage})
      : this.__(
          historyStatus: HistoryStatus.failure,
          errorMessage: errorMessage,
        );

  final HistoryViewType historyView;
  final HistoryStatus historyStatus;
  final List<TransactionEntity> histories;
  final String? errorMessage;

  HistoryState copyWith({
    HistoryViewType? historyView,
    HistoryStatus? historyStatus,
    List<TransactionEntity>? histories,
    String? errorMessage,
  }) {
    return HistoryState.__(
      historyView: historyView ?? this.historyView,
      historyStatus: historyStatus ?? this.historyStatus,
      histories: histories ?? this.histories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        historyView,
        historyStatus,
        histories,
        errorMessage,
      ];
}
