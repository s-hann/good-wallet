import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/feature/_feature_export.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class AddTransactionWidget extends StatelessWidget {
  const AddTransactionWidget({
    required this.scrollController,
    this.transactionId,
    super.key,
  });

  final ScrollController scrollController;

  /// Add [transactionId] to view or edit the transaction details
  final String? transactionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTransactionBloc(
        transactionRepository: context.read<TransactionRepository>(),
      )..add(Initialize(transactionId: transactionId)),
      child: _AddTransactionView(scrollController: scrollController),
    );
  }
}

class _AddTransactionView extends StatelessWidget {
  const _AddTransactionView({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddTransactionBloc>().state;
    return GestureDetector(
      onTap: () {
        final focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 80,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFE0E0E0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Add Transaction',
                style: GWTextStyle.bold20,
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: GWColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: GWColors.grayscale.shade900.withOpacity(0.1),
                    ),
                  ],
                ),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: GWColors.primary,
                    ),
                    labelStyle: GWTextStyle.medium16,
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: GWColors.grayscale.shade700,
                    tabs: const [
                      Tab(text: 'Income'),
                      Tab(text: 'Expenses'),
                      Tab(text: 'Transfer'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const DashboardDivider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecLabel,
                        label: 'Label',
                        hintText: 'Input your label here',
                      ),
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecCategory,
                        label: 'Category',
                        hintText: 'Choose category',
                        onTap: () async {
                          await showModalBottomSheet<String>(
                            context: context,
                            barrierColor: GWColors.transparent,
                            backgroundColor: const Color(0xFFF5F5F5),
                            builder: (context) {
                              return const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test1234'),
                                  Text('Test5678'),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecWallet,
                        label: 'Wallet',
                        hintText: 'Choose wallet',
                        onTap: () async {
                          await showModalBottomSheet<String>(
                            context: context,
                            builder: (_) {
                              return const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Test1234'),
                                  Text('Test5678'),
                                ],
                              );
                            },
                          ).then((value) => null);
                        },
                      ),
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecAmount,
                        label: 'Amount',
                        hintText: '123.456',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Rp',
                                style: GWTextStyle.regular14,
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 28,
                                width: 1,
                                color: GWColors.grayscale.shade500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecDate,
                        label: 'Date',
                        hintText: 'Empty',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.calendar_month_rounded,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 28,
                                width: 1,
                                color: GWColors.grayscale.shade500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GWTextField(
                        controller: state.tecNote,
                        label: 'Note',
                        hintText: 'Empty',
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GWSecondaryButton(
                              onPressed: () {
                                context
                                    .read<AddTransactionBloc>()
                                    .add(const Initialize());
                              },
                              text: 'Cancel',
                              borderColor: GWColors.danger,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GWPrimaryButton(
                              onPressed: () {
                                // TODO(s-hann): change transaction type
                                context.read<AddTransactionBloc>().add(
                                      const AddTransaction(
                                        type: TransactionType.expense,
                                      ),
                                    );
                              },
                              text: 'Save',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
