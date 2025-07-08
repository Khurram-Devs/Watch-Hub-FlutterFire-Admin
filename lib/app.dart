import 'package:adminside/core/providers/drawer_provider.dart';
import 'package:adminside/core/providers/order_provider.dart';
import 'package:adminside/core/providers/route_provider.dart';
import 'package:adminside/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          final routeProvider = Provider.of<RouteProvider>(
            context,
            listen: false,
          );
          final savedRoute = routeProvider.getRouteFromLocalStorage();
          final route = savedRoute ?? "/dashboard";

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Watch-Hub',
            routerConfig: AppRouter(route).router,
          );
        },
      ),
    );
  }
}
