import 'package:adminside/console/desktop_console.dart';
import 'package:adminside/console/mobile_console.dart';
import 'package:adminside/console/tablet_console.dart';
import 'package:adminside/core/res/responsive.dart';
import 'package:flutter/material.dart';


class ConsolePage extends StatelessWidget {
  final String section;
  const ConsolePage({required this.section,super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: MobileConsole(),   
                      tablet: TabletConsole(), 
                      desktop: DesktopConsole());
  }
}