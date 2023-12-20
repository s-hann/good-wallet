import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

/// Primary Button
class GWPrimaryButton extends StatelessWidget {
  /// Parameters needed for primary button
  const GWPrimaryButton({
    super.key,
    this.onPressed,
    this.icon,
    this.text,
  });

  /// function on button pressed
  final void Function()? onPressed;

  ///
  final Widget? icon;

  ///
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: GWColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          ),
          Text(
            '$text',
            style: GWTextStyle.medium16.copyWith(
              color: GWColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
