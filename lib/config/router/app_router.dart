import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_3_demo_clone/config/adaptive/adaptive_body.dart';
import 'package:material_3_demo_clone/screens/home.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    initialLocation: '/component',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Home(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/component',
                builder: (context, state) {
                  return AdaptiveBody(
                    body: Center(child: Text('${state.path} 1')),
                    secondaryBody: Center(child: Text('${state.path} 2')),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/color',
                builder: (context, state) {
                  return Center(child: Text('${state.path}'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/typography',
                builder: (context, state) {
                  return Center(child: Text('${state.path}'));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/elevation',
                builder: (context, state) {
                  return Center(child: Text('${state.path}'));
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
