import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const HistoryCard(
        //   label: 'Mini sling bag',
        //   category: 'Apparel',
        //   price: 500000,
        //   transactionType: 'income',
        // ),
        // const HistoryCard(
        //   label: 'Ramen',
        //   category: 'Food',
        //   price: 40000,
        //   transactionType: 'expense',
        // ),
        // const HistoryCard(
        //   label: 'Charity',
        //   category: 'Social',
        //   price: 200000,
        //   transactionType: 'transfer',
        // ),
        // const HistoryCard(
        //   label: 'Make Up',
        //   category: 'Beauty',
        //   price: 1000000,
        //   transactionType: 'expense',
        // ),
        // const HistoryCard(
        //   label: 'Salary',
        //   category: 'BCA',
        //   price: 7000000,
        //   transactionType: 'income',
        // ),
        SvgPicture.asset(
          'assets/images/empty_placeholder/empty_history.svg',
        ),
        const SizedBox(height: 16),
        Text(
          'No History Added',
          style: GWTextStyle.regular20,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: GWPrimaryButton(
            onPressed: () {
              context.read<DashboardBloc>().add(
                    const AddTransaction(),
                  );
            },
            text: 'Add My First Transaction',
          ),
        ),
      ],
    );
  }
}
