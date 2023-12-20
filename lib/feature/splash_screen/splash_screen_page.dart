import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_ui/wallet_ui.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo/logo_good_wallet.svg'),
            const SizedBox(height: 16),
            Text(
              'Good Wallet',
              style: GWTextStyle.bold24.copyWith(
                color: GWColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
