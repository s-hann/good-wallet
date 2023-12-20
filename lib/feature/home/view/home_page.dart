import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_wallet/feature/history/history.dart';
import 'package:good_wallet/feature/home/home.dart';
import 'package:good_wallet/feature/wishlist/wishlist.dart';
import 'package:wallet_widget/wallet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/backgrounds/bg_dashboard.svg',
              width: double.infinity,
              height: 228,
              fit: BoxFit.fill,
            ),
          ),
          const Column(
            children: [
              SizedBox(height: 80),
              HomeTotalCard(),
              SizedBox(height: 24),
              HistoryOverview(),
              SizedBox(height: 24),
              DashboardDivider(),
              SizedBox(height: 24),
              WishlistView(),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
