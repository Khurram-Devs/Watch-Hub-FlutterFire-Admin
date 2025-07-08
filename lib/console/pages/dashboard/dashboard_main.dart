import 'package:adminside/console/pages/dashboard/dashboard_desktop.dart';
import 'package:adminside/console/pages/dashboard/dashboard_mobile.dart';
import 'package:adminside/console/pages/dashboard/dashboard_tablet.dart';
import 'package:adminside/core/res/responsive.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive /* Not Found in video yet! */ (mobile: DashboardPageMobile(), tablet: DashboardPageTablet(), desktop: DashboardPageDesktop())
  }
}