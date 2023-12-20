part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

// class InitializePage extends DashboardEvent {
//   const InitializePage({
//     required this.panelController,
//   });
  
//   final PanelController panelController;

//   @override
//   List<Object?> get props => [panelController];
// }

class SwitchIndex extends DashboardEvent {
  const SwitchIndex({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class AddTransaction extends DashboardEvent {
  const AddTransaction();

  @override
  List<Object?> get props => [];
}
