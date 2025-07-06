import 'package:adminside/routes/error_page.dart';
import 'package:flutter/material.dart';
import '../console/console_page.dart';


class AppRouter {
    GoRouter get router {
        return GoRouter (
            initialLocation: '/dashboard',
            routes: [
                GoRoute(
                    name: AppRouterGr.dashboardRoute,
                    path: '/dashboard',
                    builder: (context,state) {
                        return const ConsolePage();
                    },
                ),
            ],
            errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
        );
    }
}