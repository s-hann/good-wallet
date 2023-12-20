import 'package:flutter/material.dart';
import 'package:good_wallet/helper/functions.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class HomeTotalCard extends StatelessWidget {
  const HomeTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: GWColors.primary, // change with gradient
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'DMSans',
              color: GWColors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Rp ${moneyFormatter('10281980')}',
            style: GWTextStyle.boldA32.copyWith(
              color: GWColors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Favorite Wallet',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'DMSans',
              color: GWColors.white,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: GWSecondaryButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add New Wallet',
                                  style: GWTextStyle.regular14,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(), // import close icon
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC8CACD),
                                  ),
                                ),
                                hintText: "Type wallet's name here...",
                                hintStyle: GWTextStyle.regular14.copyWith(
                                  color: const Color(0xFFB1B5BA),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: GWPrimaryButton(
                                onPressed: () {},
                                text: 'Save',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.add_box_rounded,
                color: GWColors.primary,
              ),
              text: 'Add New Wallet',
            ),
          ),
        ],
      ),
    );
  }
}
