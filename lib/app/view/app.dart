import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_wallet/app/app.dart';
import 'package:good_wallet/feature/dashboard/dashboard.dart';
import 'package:good_wallet/feature/login/login.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:wallet_ui/wallet_ui.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required TransactionRepository transactionRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _transactionRepository = transactionRepository;

  final AuthenticationRepository _authenticationRepository;
  final TransactionRepository _transactionRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _transactionRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final statusApp = context.select((AppBloc bloc) => bloc.state.status);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: GWColors.primary),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: GWColors.primary,
        ),
      ),
      // TODO(s-hann): Add localizations
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          if (statusApp == AppStatus.authenticated) {
            return const DashboardPage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
