import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:good_wallet/feature/history/history.dart';
import 'package:good_wallet/feature/home/home.dart';
import 'package:good_wallet/feature/more_settings/more_settings.dart';
import 'package:good_wallet/feature/wishlist/wishlist.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial(PanelController())) {
    // on<InitializePage>(_initializePage);
    on<SwitchIndex>(_switchIndex);
    on<AddTransaction>(_addTransaction);
  }

  final _pages = <Widget>[
    const HomePage(),
    const HistoryPage(),
    const SizedBox.shrink(),
    const WishlistPage(),
    const MoreSettingsPage(),
  ];

  // void _initializePage(InitializePage event, Emitter<DashboardState> emit) {
  //   emit(
  //     state.copyWith(panelController: event.panelController),
  //   );
  // }

  void _switchIndex(
    SwitchIndex event,
    Emitter<DashboardState> emit,
  ) {
    final index = event.index;
    if (index != 2) {
      emit(
        state.copyWith(
          index: index,
          activePage: _pages[index],
        ),
      );
    }
  }

  void _addTransaction(AddTransaction event, Emitter<DashboardState> emit) {
    if (state.panelController!.isAttached) {
      state.panelController!.open();
      // TODO(s-hann): call initialize transaction

    }
  }
}
