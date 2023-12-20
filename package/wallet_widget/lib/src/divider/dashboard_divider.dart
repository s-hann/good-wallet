import 'package:flutter/widgets.dart';
import 'package:wallet_ui/wallet_ui.dart';

/// Divider
class DashboardDivider extends StatelessWidget {
  /// Dashboard Divider
  const DashboardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 12,
      color: GWColors.grayscale.shade200,
    );
  }
}
