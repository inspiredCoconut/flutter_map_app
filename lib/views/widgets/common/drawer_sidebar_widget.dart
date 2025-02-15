import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/routes.dart';

class DrawerSidebarWidget extends StatefulWidget {
  const DrawerSidebarWidget({super.key});

  @override
  _DrawerSidebarWidgetState createState() => _DrawerSidebarWidgetState();
}

class _DrawerSidebarWidgetState extends State<DrawerSidebarWidget> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
      ListTile(
        title: const Text('Home'),
        onTap: () {
          context.go(RoutesApp.home);
        },
      ),
      ListTile(
        title: const Text('Map'),
        onTap: () {
          context.go(RoutesApp.map);
        },
      ),
      ListTile(
        title: const Text('Settings'),
        onTap: () {
          print('Settings');
        },
      ),
    ]);
  }
}