part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState.__({
    this.index = 0,
    this.activePage = const HomePage(),
    this.panelController,
    this.transactionId,
  });

  const DashboardState.initial(PanelController panelController)
      : this.__(panelController: panelController);

  final int index;
  final Widget activePage;
  final PanelController? panelController;
  final String? transactionId;

  DashboardState copyWith({
    int? index,
    Widget? activePage,
    PanelController? panelController,
    String? transactionId,
  }) {
    return DashboardState.__(
      index: index ?? this.index,
      activePage: activePage ?? this.activePage,
      panelController: panelController ?? this.panelController,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  @override
  List<Object?> get props => [
        index,
        activePage,
        panelController,
        transactionId,
      ];
}
