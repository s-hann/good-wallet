import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_wallet/feature/history/bloc/history_bloc.dart';
import 'package:good_wallet/feature/history/view/widgets/_widgets.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        transactionRepository: context.read<TransactionRepository>(),
      )..add(GetHistory()),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: GWColors.transparent,
            elevation: 0,
            title: Text(
              'Transaction History',
              style: GWTextStyle.bold20,
            ),
            centerTitle: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/ic_search.svg',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: GWColors.grayscale.shade200,
                      ),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: GWColors.primary,
                      ),
                      labelStyle: GWTextStyle.medium16,
                      labelPadding: EdgeInsets.zero,
                      unselectedLabelColor: GWColors.grayscale.shade700,
                      tabs: const [
                        Tab(text: 'Table'),
                        Tab(text: 'Chart'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/ic_filter.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const DashboardDivider(),
          const SizedBox(height: 16),
          const Expanded(
            child: LoadHistory(),
          ),
        ],
      ),
    );
  }
}
