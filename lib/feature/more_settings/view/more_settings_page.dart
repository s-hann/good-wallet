import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/core/authentication_bloc/authentication_bloc.dart';
import 'package:good_wallet/feature/login/login.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class MoreSettingsPage extends StatelessWidget {
  const MoreSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      )..add(GetCurrentUser()),
      child: const _MoreSettingsView(),
    );
  }
}

class _MoreSettingsView extends StatelessWidget {
  const _MoreSettingsView();

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthenticationBloc>().state.user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          // title
          backgroundColor: GWColors.white,
          elevation: 0,
          title: Text(
            'More',
            style: GWTextStyle.bold20,
          ),
          centerTitle: true,
        ),
        const DashboardDivider(),
        Container(
          // profile
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.displayName ?? '...',
                      style: GWTextStyle.bold24,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Email Verified',
                      style: GWTextStyle.regular10,
                    ),
                  ],
                ),
              ),
              if (user != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${user.photoURL}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ] else ...[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: GWColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.question_mark_rounded,
                    color: GWColors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: GWColors.grayscale.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.abc),
                      const SizedBox(height: 8),
                      Text(
                        'Categories',
                        style: GWTextStyle.medium16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: GWColors.grayscale.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.abc),
                      const SizedBox(height: 8),
                      Text(
                        'Wallet',
                        style: GWTextStyle.medium16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: GWColors.grayscale.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.abc),
                      const SizedBox(height: 8),
                      Text(
                        'Help',
                        style: GWTextStyle.medium16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GWPrimaryButton(
            onPressed: () {},
            text: 'Remove Ads',
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GWSecondaryButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_rounded,
              color: GWColors.black,
              size: 16,
            ),
            text: 'Rate Us!',
          ),
        ),
        const SizedBox(height: 16),
        const DashboardDivider(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Account',
            style: GWTextStyle.bold20,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: GWColors.grayscale,
                ),
              ),
            ),
            child: Text(
              'Edit Profile',
              style: GWTextStyle.medium16,
            ),
          ),
        ),
        const DashboardDivider(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Security PIN',
            style: GWTextStyle.bold20,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: GWColors.grayscale,
                ),
              ),
            ),
            child: Text(
              'Change PIN',
              style: GWTextStyle.medium16,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: GWColors.grayscale,
                ),
              ),
            ),
            child: Text(
              'Set PIN',
              style: GWTextStyle.medium16,
            ),
          ),
        ),
        const DashboardDivider(),
        const SizedBox(height: 16),
        InkWell(
          child: const Text('Log Out'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
