import 'package:flutter/material.dart';

class DashboardPageMobile extends StatelessWidget {
  const DashboardPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Dashboard", style: TextStyle(
        color: Colors.black
      ),),),
    );
  }
}