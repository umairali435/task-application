import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using go_router package
class HomePage extends StatelessWidget {
  final Widget child;
  const HomePage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
            child: AppNavigationBar(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
