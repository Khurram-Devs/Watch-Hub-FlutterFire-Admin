import 'package:adminside/console/desktop_console.dart';
import 'package:adminside/console/mobile_console.dart';
import 'package:adminside/console/tablet_console.dart';
import 'package:flutter/material.dart';


class ConsolePage extends StatelessWidget {
  const ConsolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: MobileConsole(), 
                      table: TabletConsole(), 
                      desktop: DesktopConsole());
  }
}