
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/core/router/app_routes.dart';
import 'package:bandnameapp/core/di/injection_container.dart';
import 'package:bandnameapp/features/bands/presentation/bloc/bands_bloc.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppState extends StatelessWidget {
  final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    // return MainApp();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocketServiceBloc>(
          create: (BuildContext context) =>
              injectionContainerImpl.sl<SocketServiceBloc>(),
        ),
        BlocProvider<BandsBloc>(
          create: (BuildContext context) =>
              injectionContainerImpl.sl<BandsBloc>(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: router,
    );
  }
}
