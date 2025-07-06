import 'package:adminside/core/providers/drawer_provider.dart';
import 'package:adminside/routes/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
    const App({super.key});

    @override
    State<App> createState() => _AppState();
}

class _AppState extends State<App> {
    @override
    Widget build(BuildContext context) {
        return MultiProvider (
            providers: [
                ChangeNotifierProvider(create: (_) => DrawerProvider()),
            ],
            child: Sizer(builder: (context, orientation, deviceType) {
                return MaterialApp.router (
                    debugShowCheckedModeBanner: false,
                    title: 'Watch-Hub',
                    routerConfig: AppRouter().router,
                );
            }),
        );
    }
}