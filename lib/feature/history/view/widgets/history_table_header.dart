import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

class HistoryTableHeader extends StatelessWidget {
  const HistoryTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      color: GWColors.grayscale,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Label',
              style: GWTextStyle.medium16,
            ),
          ),
          Text(
            'Wallet',
            style: GWTextStyle.medium16,
          ),
          Expanded(
            child: Text(
              'Amount',
              style: GWTextStyle.medium16,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
