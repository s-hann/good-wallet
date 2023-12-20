import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:good_wallet/feature/history/view/widgets/history_card.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';

class ListHisory extends StatelessWidget {
  const ListHisory({
    required this.transactionsList,
    this.isDashboardPage = false,
    super.key,
  });

  final List<TransactionEntity> transactionsList;
  final bool isDashboardPage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        final transaction = transactionsList[index];
        return InkWell(
          onTap: () {
            context.read<DashboardBloc>().add(const AddTransaction());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: HistoryCard(
              label: '${transaction.label}',
              wallet: transaction.wallet,
              price: transaction.amount?.round() ?? 0,
              transactionType: transaction.type!,
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: GWColors.grayscale,
            thickness: 1,
          ),
        );
      },
      itemCount: isDashboardPage && transactionsList.length >= 5
          ? 5
          : transactionsList.length,
    );
  }
}
