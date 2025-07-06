import 'package:flutter/material.dart';

class DashboardPageDesktop extends StatelessWidget {
  const DashboardPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Dashboard", style: TextStyle(
        color: Colors.black
      ),),),
    );
  }
}