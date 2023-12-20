import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/core/authentication_bloc/authentication_bloc.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:wallet_ui/wallet_ui.dart';
import 'package:wallet_widget/wallet_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  _LoginView();

  final _tecEmail = TextEditingController();
  final _tecPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GWColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 54),
              Text(
                'Login',
                style: GWTextStyle.bold24,
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome back! I will help you track your expenses',
                style: GWTextStyle.regular14.copyWith(
                  color: GWColors.grayscale.shade700,
                ),
              ),
              const SizedBox(height: 24),
              GWTextField(
                controller: _tecEmail,
                label: 'Email',
                hintText: 'Input your email',
              ),
              const SizedBox(height: 24),
              GWTextField(
                controller: _tecPassword,
                label: 'Password',
                hintText: 'Input your password',
              ),
              const SizedBox(height: 24),
              Center(
                child: InkWell(
                  child: Text(
                    'Forgot your password?',
                    style: GWTextStyle.medium14.copyWith(
                      color: GWColors.danger,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              GWPrimaryButton(
                onPressed: () {},
                text: 'Login',
              ),
              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have account yet? ",
                    style: GWTextStyle.medium16,
                    children: [
                      TextSpan(
                        text: 'Register Here',
                        style: GWTextStyle.medium14.copyWith(
                          color: GWColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    thickness: 1,
                    color: GWColors.grayscale,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: GWColors.white,
                    ),
                    child: Text(
                      'or try',
                      style: GWTextStyle.medium16.copyWith(
                        color: GWColors.grayscale.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (_, state) {
                  final status = state.status;
                  if (status == AuthenticationStatus.success &&
                      state.credential != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const DashboardPage(),
                      ),
                    );
                  } else if (status == AuthenticationStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: GWColors.transparent,
                        elevation: 0,
                        content: Text(
                          '${state.errorMessage}',
                          style: GWTextStyle.regular14.copyWith(
                            color: GWColors.danger,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: GWSecondaryButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(SignInGoogle());
                    },
                    // icon: SvgPicture.asset(assetName),
                    text: 'Login with Google',
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
