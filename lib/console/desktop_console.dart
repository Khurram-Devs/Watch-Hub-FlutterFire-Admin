import 'package:adminside/changes/colors.dart';
import 'package:adminside/console/widget/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopConsole extends StatefulWidget {
  const DesktopConsole({super.key});

  @override
  State<DesktopConsole> createState() => _DesktopConsoleState();
}

class _DesktopConsoleState extends State<DesktopConsole> {
  String selectedPage = "Dashboard";
  void _onSelectedPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
        Sidebar(onSlectPage: _onSelectedPage, selectedPage: selectedPage,)
        ],
      ),
    );
  }
}