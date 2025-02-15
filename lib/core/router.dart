import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constants/routes.dart';
import '../views/home/home_view.dart';
import '../views/map/map_view.dart';
import '../views/widgets/layout/main_layout.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesApp.home,
  routes: [
    _standardRoute(RoutesApp.home,
        MainLayout(child: HomeView(title: 'Flutter Map App'))),
    _standardRouteNoTransition(RoutesApp.map, MainLayout(child: MapView()))
  ],
);

GoRoute _standardRoute(String pathRoute, Widget widget) {
  return GoRoute(
    path: pathRoute,
    builder: (context, state) => widget,
  );
}

GoRoute _standardRouteNoTransition(String pathRoute, Widget widget) {
  return GoRoute(
    path: pathRoute,
    builder: (context, state) => widget,
    pageBuilder: (context, state) => NoTransitionPage(child: widget),
  );
}
