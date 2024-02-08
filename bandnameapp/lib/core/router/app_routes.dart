import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bandnameapp/core/router/routes.dart';
import 'package:bandnameapp/core/constants/router_paths.dart';

final router = GoRouter(
  initialLocation: RouterPaths.status,
  routes: [
    //SignIn
    GoRoute(
      path: RouterPaths.home,
      builder: (BuildContext context, GoRouterState state) => BandsScreen(),
    ),
    GoRoute(
      path: RouterPaths.status,
      builder: (BuildContext context, GoRouterState state) => StatusScreen(),
    ),
  ],
);
