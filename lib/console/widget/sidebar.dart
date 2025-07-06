import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final Function(String) onSlectPage;
  final String selectedPage;
  const Sidebar({super.key,
  required this.onSlectPage,
  required this.selectedPage
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: screenWidth > 1800 ? 270 : screenWidth < 1140 ? 220 : 270,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/logo.svg"),
                    SizedBox(width: 10,),
                    Column(children: [
                      Text('Watch-Hub', style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      ),)
                    ],)
                  ],
                ),
              )
              ]
            ),
          )
        ]
      ),
    );
  }
}