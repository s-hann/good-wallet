import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:good_wallet/feature/history/history.dart';
import 'package:wallet_ui/wallet_ui.dart';

class HistoryOverview extends StatelessWidget {
  const HistoryOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: GWTextStyle.bold20,
              ),
              InkWell(
                onTap: () {
                  context.read<DashboardBloc>().add(
                        const SwitchIndex(index: 1),
                      );
                },
                child: Text(
                  'Show All',
                  style: GWTextStyle.medium16.copyWith(
                    color: GWColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const LoadHistory(isDashboardPage: true),
        ],
      ),
    );
  }
}
