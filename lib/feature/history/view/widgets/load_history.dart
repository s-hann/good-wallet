import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/feature/history/bloc/history_bloc.dart';
import 'package:good_wallet/feature/history/view/widgets/_widgets.dart';
import 'package:wallet_ui/wallet_ui.dart';

class LoadHistory extends StatelessWidget {
  const LoadHistory({
    this.isDashboardPage = false,
    super.key,
  });

  final bool isDashboardPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state.historyStatus == HistoryStatus.success) {
          return TabBarView(
            children: [
              if (state.histories.isEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 16,
                  ),
                  child: EmptyHistory(),
                ),
              ] else ...[
                Column(
                  children: [
                    const HistoryTableHeader(),
                    Expanded(
                      child: ListHisory(
                        transactionsList: state.histories,
                        isDashboardPage: isDashboardPage,
                      ),
                    ),
                  ],
                ),
              ],
              Text(
                'TEst',
                style: GWTextStyle.boldA32,
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
