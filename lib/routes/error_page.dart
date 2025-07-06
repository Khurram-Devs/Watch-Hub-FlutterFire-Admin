import 'package:flutter/material.dart';

class ErrorPage extends StatefullWidget {
    const ErrorPage({super.key});

@override
State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
    @override
    Widget build(BuildContext context) {
        final screenWidth * MediaQuery.of(context).size.width;
        return Container(
            width: screenWidth,
            height: 100.h,
            color: Colors.green,
        );
    }
}