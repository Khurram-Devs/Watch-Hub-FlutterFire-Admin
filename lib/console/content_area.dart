import 'package:adminside/console/pages/dashboard/dashboard_main.dart';
import 'package:adminside/console/pages/orders/orders_main.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatefulWidget {
  final String selectedPage;
  const ContentArea({super.key, required this.selectedPage});

  @override
  State<ContentArea> createState() => _ContentAreaState();
}

class _ContentAreaState extends State<ContentArea> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selectedPage) {
      case "dashboard":
        return const DashboardPage();
      case "orders":
        return const OrdersPage();
      default:
        return const Center(child: Text('Page Not Found'));
    }
  }
}
