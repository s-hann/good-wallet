import 'package:flutter/material.dart';
import 'package:good_wallet/helper/functions.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    required this.label,
    required this.wallet,
    required this.price,
    required this.transactionType,
    super.key,
  });

  final String label;
  final String? wallet;
  final int price;
  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    Color transactionColor;
    if (transactionType == TransactionType.income) {
      transactionColor = GWColors.success;
    } else if (transactionType == TransactionType.expense) {
      transactionColor = GWColors.danger;
    } else {
      transactionColor = GWColors.black;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: GWTextStyle.medium14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (wallet != null) ...[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: GWColors.grayscale.shade200,
            ),
            child: Text(
              '$wallet',
              style: GWTextStyle.medium14,
            ),
          ),
        ],
        Expanded(
          child: Text(
            moneyFormatter('$price'),
            style: GWTextStyle.bold14.copyWith(
              color: transactionColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
