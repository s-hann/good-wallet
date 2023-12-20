import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_ui.dart';

/// Good Wallet's default text field
class GWTextField extends StatelessWidget {
  ///
  const GWTextField({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.errorMessage,
  });

  ///
  final String? label;

  ///
  final TextEditingController? controller;

  ///
  final String? hintText;

  ///
  final Widget? prefixIcon;

  ///
  final Widget? suffixIcon;

  ///
  final void Function(String)? onChanged;

  ///
  final void Function()? onTap;

  /// to show error message
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final isClickable = onTap != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            '$label',
            style: GWTextStyle.regular14,
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          style: GWTextStyle.regular14,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hintText,
            hintStyle: GWTextStyle.regular14.copyWith(
              color: GWColors.grayscale.shade600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: GWColors.grayscale,
              ),
              borderRadius: BorderRadius.circular(8),
              gapPadding: 2,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: GWColors.primary,
              ),
              borderRadius: BorderRadius.circular(8),
              gapPadding: 2,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
          onTap: onTap,
          textInputAction: isClickable ? TextInputAction.none : null,
          keyboardType: isClickable ? TextInputType.none : null,
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            '$errorMessage',
            style: GWTextStyle.regular14.copyWith(
              color: GWColors.danger,
            ),
          ),
        ],
      ],
    );
  }
}
