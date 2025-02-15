import 'package:flutter/material.dart';

class SidebarWidget extends StatefulWidget {
  final Function onPressed;
  const SidebarWidget({super.key, required this.onPressed});

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: 'sidebar',
          onPressed: () => widget.onPressed(context),
          child: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
