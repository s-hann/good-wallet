import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_wallet/feature/wishlist/wishlist.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistBloc(),
      child: const _WishlistView(),
    );
  }
}

class _WishlistView extends StatelessWidget {
  const _WishlistView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: GWColors.white,
                elevation: 0,
                leading: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/ic_search.svg',
                    ),
                  ),
                ),
                title: Text(
                  'Wishlist',
                  style: GWTextStyle.bold20,
                ),
                centerTitle: true,
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/ic_filter.svg',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: GWColors.white,
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
                      Tab(
                        text: 'Card',
                      ),
                      Tab(
                        text: 'Table',
                      ),
                    ],
                  ),
                ),
              ),
              const DashboardDivider(),
              Container(
                padding: const EdgeInsets.all(16),
                color: GWColors.white,
                child: Visibility(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: GWColors.primary,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_box_rounded,
                          color: GWColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add New Wishlist',
                          style: GWTextStyle.medium16.copyWith(
                            color: GWColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            color: GWColors.white,
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              indicatorWeight: 4,
                              labelColor: GWColors.primary,
                              labelStyle: GWTextStyle.medium16,
                              labelPadding: const EdgeInsets.only(
                                top: 4,
                                bottom: 8,
                              ),
                              unselectedLabelColor: GWColors.grayscale.shade700,
                              tabs: const <Widget>[
                                Text('Buy'),
                                Text('Delay'),
                                Text('Not Set'),
                                Text('Cancelled'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ColoredBox(
                              color: GWColors.grayscale.shade200,
                              child: const TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 40,
                                    ),
                                    child: EmptyWishlist(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 40,
                                    ),
                                    child: Text('hi!'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 40,
                                    ),
                                    child: EmptyWishlist(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 40,
                                    ),
                                    child: EmptyWishlist(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('tab2'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
