import 'package:adminside/routes/error_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../console/console_page.dart';

class AppRouter {
  final String route;
  AppRouter(this.route);
  GoRouter get router {
    return GoRouter(
      initialLocation: route,
      routes: [
        GoRoute(
          name: AppRouterGr.dashboardRoute,
          /* Not Found in video yet! */
          path: '/:section',
          builder: (context, state) {
            final String section = state.pathParameters['section']!;
            return ConsolePage(section: section);
          },
        ),
      ],
      errorPageBuilder:
          (context, state) => const MaterialPage(child: ErrorPage()),
    );
  }
}
