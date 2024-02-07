import 'package:flutter/material.dart';

import 'package:bandnameapp/core/router/app_routes.dart';

class AppState extends StatelessWidget {
  // final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    // required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MainApp();
    // return MultiBlocProvider(
    //   providers: const [],
    //   child: const MainApp(),
    // );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: router,
    );
  }
}
