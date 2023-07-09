import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _detailNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'detail');

class AppRoutes {
  static final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/tasks',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return HomePage(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/tasks',
            builder: (BuildContext context, GoRouterState state) {
              return TasksPage();
            },
          ),
          GoRoute(
            path: '/projects',
            builder: (BuildContext context, GoRouterState state) {
              return ProjectsPage();
            },
          ),
          GoRoute(
            path: '/teams',
            builder: (BuildContext context, GoRouterState state) {
              return TeamsPage();
            },
          ),
          GoRoute(
            path: '/tasks/:taskid',
            builder: (BuildContext context, GoRouterState state) {
              return TasksPage(
                id: state.pathParameters['taskid'],
                description: state.extra.toString(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
