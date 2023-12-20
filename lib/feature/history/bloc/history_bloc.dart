import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_repository/transaction_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({
    required TransactionRepository transactionRepository,
  })  :
        _transactionRepository = transactionRepository,
        super(const HistoryState.initial()) {
    on<GetHistory>(_getHistory);
  }

  final TransactionRepository _transactionRepository;

  Future<void> _getHistory(GetHistory event, Emitter<HistoryState> emit) async {
    emit(const HistoryState.loading());
    try {
      // TODO(s-hann): change UID
      final transactions = await _transactionRepository.fetchAllTransaction(
        uid: 'CoP5HTuW6fMu3KTl0E3scML1HgN2',
      );
      emit(HistoryState.success(histories: transactions));
    } catch (e) {
      emit(HistoryState.failure(errorMessage: '$e'));
    }
  }
}
