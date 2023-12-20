import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const _WishlistCardView();
  }
}

class _WishlistCardView extends StatelessWidget {
  const _WishlistCardView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wishlist Title',
                style: GWTextStyle.medium16,
              ),
              const SizedBox(height: 8),
              Container(
                height: 22.4,
                width: 50,
                color: Colors.grey,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '14/09/2023',
                style: GWTextStyle.regular10,
              ),
              const SizedBox(height: 12),
              Text(
                '800.000',
                style: GWTextStyle.bold14.copyWith(
                  color: const Color(0xFF003B7A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
