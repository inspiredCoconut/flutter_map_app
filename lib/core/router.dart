import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constants/routes.dart';
import '../views/home/home_view.dart';
import '../views/map/map_view.dart';
import '../views/auth/login_view.dart';
import '../views/widgets/layout/main_layout.dart';
import 'package:flutter_map_app/core/service/auth_service.dart';
import 'package:flutter_map_app/core/service/locator_service.dart';

final AuthService authService = locator<AuthService>();

final GoRouter router = GoRouter(
  initialLocation: RoutesApp.home,
  routes: [
    _standardRoute(RoutesApp.login, LoginView()),
    _protectedRouteNotrasition(RoutesApp.home,
        MainLayout(child: HomeView(title: 'Flutter Map App'))),
    _protectedRouteNotrasition(RoutesApp.map, MainLayout(child: MapView()))
  ],
);

GoRoute _standardRoute(String pathRoute, Widget widget) {
  return GoRoute(
    path: pathRoute,
    builder: (context, state) => widget,
  );
}

GoRoute _protectedRouteNotrasition(String pathRoute, Widget widget) {
  return GoRoute(
    path: pathRoute,
    builder: (context, state) =>  widget,
    pageBuilder: (context, state) =>NoTransitionPage(child: widget),
    redirect: (_, __) => authService.isAuthenticated() ? null : RoutesApp.login,
  );
}
