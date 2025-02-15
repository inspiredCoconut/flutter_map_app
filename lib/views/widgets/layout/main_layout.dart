import 'package:flutter/material.dart';

import '../common/sidebar_widget.dart';
import '../common/drawer_sidebar_widget.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  void onPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: widget.child),
        ],
      ),
      floatingActionButton: SidebarWidget(onPressed: onPressed),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      drawer: DrawerSidebarWidget(),
    );
  }
}
