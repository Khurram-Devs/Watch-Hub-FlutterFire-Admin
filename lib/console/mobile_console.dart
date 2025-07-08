import 'package:adminside/changes/colors.dart';
import 'package:adminside/console/content_area.dart';
import 'package:adminside/console/widget/_mobile_drawer.dart';
import 'package:adminside/console/widget/_navbar_tablet.dart';
import 'package:adminside/core/providers/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MobileConsole extends StatefulWidget {
  const MobileConsole({super.key});

  @override
  State<MobileConsole> createState() => _MobileConsoleState();
}

class _MobileConsoleState extends State<MobileConsole> {
  String selectedPage = "dashboard";
  void _onSelectedPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String section =
        GoRouter.of(
          context,
        ).routerDelegate.currentConfiguration.pathParameters['section'] ??
        selectedPage;

    setState(() {
      selectedPage = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Scaffold(
      key: drawerProvider.keyDashboard,
      backgroundColor: bgColor,
      drawer: MobileDrawer(onSelectPage: _onSelectedPage),
      body: Column(
        children: [
          const NavbarTablet(),
          Expanded(child: ContentArea(selectedPage: selectedPage)),
        ],
      ),
    );
  }
}
