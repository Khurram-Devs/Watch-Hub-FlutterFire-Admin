import 'package:adminside/changes/colors.dart';
import 'package:adminside/core/providers/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MobileDrawer extends StatefulWidget {
  final Function(String) onSelectPage;
  const MobileDrawer({super.key, required this.onSelectPage});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Khurram',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Admin',
                        style: GoogleFonts.inter(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SidebarItem(
            title: "Dashboard",
            icon: 'assets/icons/dashboard.svg',
            onTap: () {
              widget.onSelectPage('dashboard');
              _GoRouter("/dashboard");
              Navigator.of(context).pop();
            },
          ),
          SidebarItem(
            title: "Orders",
            icon: 'assets/icons/bag.svg',
            onTap: () {
              widget.onSelectPage('orders');
              _GoRouter("/orders");
              Navigator.of(context).pop();
            },
          ),
          SidebarItem(
            title: "Analytics",
            icon: 'assets/icons/chart.svg',
            onTap: () {
              widget.onSelectPage('analytics');
              _GoRouter("/analytics");
              Navigator.of(context).pop();
            },
          ),
          SidebarItem(
            title: "Customer",
            icon: 'assets/icons/users.svg',
            onTap: () {
              widget.onSelectPage('customer');
              _GoRouter("/customer");
              Navigator.of(context).pop();
            },
          ),
          SidebarItem(
            title: "Menu",
            icon: 'assets/icons/document.svg',
            onTap: () {
              widget.onSelectPage('menu');
              _GoRouter("/menu");
              Navigator.of(context).pop();
            },
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 270,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: CircularPercentIndicator(
                      radius: 35,
                      lineWidth: 5,
                      percent: 0.86,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.transparent,
                      progressColor: primaryColor,
                      center: Text(
                        '86%',
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Subcription Plan',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Your Subscription plan will expire soon please upgrade!',
                    style: GoogleFonts.inter(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      ),
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Upgrade',
                      style: GoogleFonts.inter(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  void _GoRouter(String route) {
    GoRouter.of(context).go(route);
    Provider.of<RouteProvider>(
      context,
      listen: false,
    ).saveRouteToLocalStorage(route);
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const SidebarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        height: 15,
        width: 15,
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(color: Colors.black, fontSize: 14),
      ),
      onTap: onTap,
    );
  }
}
