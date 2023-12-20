import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

///
class GWAlertDialog extends StatelessWidget {
  ///
  const GWAlertDialog({
    super.key,
    this.title,
    this.positiveText,
    this.negativeText,
    this.onPositivePressed,
    this.onNegativePressed,
  });

  ///
  final String? title;

  /// Button text for positive case
  final String? positiveText;

  /// Button text for negative case
  final String? negativeText;

  ///
  final void Function()? onPositivePressed;

  ///
  final void Function()? onNegativePressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title',
              style: GWTextStyle.regular20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPositivePressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: GWColors.danger,
                ),
                child: Text(
                  positiveText ?? 'Yes',
                  style: GWTextStyle.medium16.copyWith(
                    color: GWColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: onNegativePressed,
              child: Text(
                negativeText ?? 'No',
                style: GWTextStyle.medium14.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
