import 'package:flutter/material.dart';

class DashboardPageTablet extends StatelessWidget {
  const DashboardPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Dashboard", style: TextStyle(
        color: Colors.black
      ),),),
    );
  }
}