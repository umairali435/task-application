import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Task list App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routerConfig: AppRoutes.routes,
      ),
    );
  }
}
