import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatefulWidget {
    const ErrorPage({super.key});

@override
State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
    @override
    Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Container(
            width: screenWidth,
            height: 100.h,
            color: Colors.green,
        );
    }
}