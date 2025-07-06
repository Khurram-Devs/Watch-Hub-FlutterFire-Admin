import 'package:flutter/material.dart';

class App extends StatefullWidget {
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