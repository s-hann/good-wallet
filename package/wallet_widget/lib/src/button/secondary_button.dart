import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

/// Secondary Button
class GWSecondaryButton extends StatelessWidget {
  /// Parameters needed for secondary button
  const GWSecondaryButton({
    super.key,
    this.onPressed,
    this.icon,
    this.text,
    this.borderColor,
  });

  /// function on button pressed
  final void Function()? onPressed;

  ///
  final Widget? icon;

  ///
  final String? text;

  ///
  final Color? borderColor;

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
        side: BorderSide(
          color: borderColor ?? GWColors.primary,
        ),
        backgroundColor: GWColors.white,
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
            style: GWTextStyle.medium16,
          ),
        ],
      ),
    );
  }
}
