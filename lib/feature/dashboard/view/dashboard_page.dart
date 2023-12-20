import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_wallet/feature/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:good_wallet/feature/add_transaction/view/add_transaction_widget.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:good_wallet/feature/history/bloc/history_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider(
          create: (context) => AddTransactionBloc(
            transactionRepository: context.read<TransactionRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(
            transactionRepository: context.read<TransactionRepository>(),
          ),
        ),
      ],
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final panelController = context.read<DashboardBloc>().state.panelController;
    return SlidingUpPanel(
      controller: panelController,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height -
          MediaQuery.of(context).viewPadding.top,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      backdropEnabled: true,
      onPanelOpened: () {
        context.read<AddTransactionBloc>().add(const Initialize());
      },
      onPanelClosed: () {
        // to reset value add transaction
        final focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
        context.read<AddTransactionBloc>().add(const Initialize());
      },
      panelBuilder: (sc) {
        return Material(
          color: GWColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: AddTransactionWidget(scrollController: sc),
        );
      },
      body: _DashboardBody(
        panelController: panelController ?? PanelController(),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    required this.panelController,
  });

  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // prevent closing app when pressing back button from add transaction page
      onWillPop: () async {
        if (panelController.isAttached && panelController.isPanelOpen) {
          await panelController.close();
          return false;
        }
        return true;
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: GWColors.white,
            resizeToAvoidBottomInset: false,
            body: state.activePage,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (panelController.isAttached) {
                  panelController.open();
                }
              },
              elevation: 4,
              backgroundColor: GWColors.darkBlue,
              child: const Icon(
                Icons.add_box_rounded,
                size: 28,
                color: GWColors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: GWColors.white,
              currentIndex: state.index,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GWTextStyle.medium14,
              unselectedLabelStyle: GWTextStyle.medium14,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/navbar_home.svg',
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      state.index == 0
                          ? GWColors.primary
                          : GWColors.grayscale.shade800,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/navbar_history.svg',
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      state.index == 1
                          ? GWColors.primary
                          : GWColors.grayscale.shade800,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'History',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    color: GWColors.transparent,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/navbar_wishlist.svg',
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      state.index == 3
                          ? GWColors.primary
                          : GWColors.grayscale.shade800,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/navbar_more.svg',
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      state.index == 4
                          ? GWColors.primary
                          : GWColors.grayscale.shade800,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'More',
                ),
              ],
              onTap: (index) {
                context.read<DashboardBloc>().add(SwitchIndex(index: index));
              },
            ),
          );
        },
      ),
    );
  }
}
