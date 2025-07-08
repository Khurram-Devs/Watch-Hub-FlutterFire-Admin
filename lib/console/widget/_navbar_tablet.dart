import 'package:adminside/core/providers/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adminside/core/res/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavbarTablet extends StatefulWidget {
  const NavbarTablet({super.key});

  @override
  State<NavbarTablet> createState() => _NavbarTabletState();
}

class _NavbarTabletState extends State<NavbarTablet> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (drawerProvider.keyDashboard.currentState != null) {
                drawerProvider.keyDashboard.currentState!.openDrawer();
              }
            },
            icon: Icon(Icons.menu, color: Colors.black),
          ),
          const Expanded(child: SizedBox()),
          if (Responsive.isTablet(context))
            Container(
              width: 280,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: Colors.black,
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/mail.svg'),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      ),
    );
  }
}
