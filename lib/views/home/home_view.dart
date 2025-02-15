import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/routes.dart';

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to this map app with Flutter',
            ),
            ElevatedButton(
              onPressed: () {
                context.go(RoutesApp.map);
              },
              child: const Text('Go to Map'),
            ),
          ],
        ),
      ),
    );
  }
}
