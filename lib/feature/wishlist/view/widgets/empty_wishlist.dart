import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_ui/wallet_ui.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/empty_placeholder/empty_wishlist.svg',
        ),
        const SizedBox(height: 16),
        Text(
          'No Wishlist Added',
          style: GWTextStyle.regular20,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: GWColors.primary,
            ),
            child: Text(
              'Add My First Wishlist',
              style: GWTextStyle.medium16.copyWith(
                color: GWColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
