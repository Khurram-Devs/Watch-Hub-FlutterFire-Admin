import 'package:adminside/changes/colors.dart';
import 'package:adminside/console/content_area.dart';
import 'package:adminside/console/widget/_navbar_desktop.dart';
import 'package:adminside/console/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopConsole extends StatefulWidget {
  const DesktopConsole({super.key});

  @override
  State<DesktopConsole> createState() => _DesktopConsoleState();
}

class _DesktopConsoleState extends State<DesktopConsole> {
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
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          Sidebar(onSlectPage: _onSelectedPage, selectedPage: selectedPage),
          Expanded(
            child: Column(
              children: [
                const NavbarDesktop(),
                Expanded(child: ContentArea(selectedPage: selectedPage)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
