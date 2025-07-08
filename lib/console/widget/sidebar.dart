import 'package:adminside/changes/colors.dart';
import 'package:adminside/core/providers/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatefulWidget {
  final Function(String) onSlectPage;
  final String selectedPage;
  const Sidebar({
    super.key,
    required this.onSlectPage,
    required this.selectedPage,
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
      width:
          screenWidth > 1800
              ? 270
              : screenWidth < 1140
              ? 220
              : 270,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 40, top: 30),
                  child: Row(
                    children: [
                      SvgPicture.asset("../../../assets/icons/logo.svg", height: 50, width: 50,),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Watch-Hub',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Admin',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SidebarItem(
                  title: 'Dashboard',
                  icon: '../../../assets/icons/dashboard.svg',
                  isSelected: widget.selectedPage == "dashboard",
                  onTap: () {
                    widget.onSlectPage("dashboard");
                    _GoRouter("/dashboard");
                  },
                ),
                SidebarItem(
                  title: 'Orders',
                  icon: '../../../assets/icons/bag.svg',
                  isSelected: widget.selectedPage == "orders",
                  onTap: () {
                    widget.onSlectPage("orders");
                    _GoRouter("/orders");
                  },
                ),
                SidebarItem(
                  title: 'Analytics',
                  icon: '../../../assets/icons/chart.svg',
                  isSelected: widget.selectedPage == "analytics",
                  onTap: () {
                    widget.onSlectPage("analytics");
                    _GoRouter("/analytics");
                  },
                ),
                SidebarItem(
                  title: 'Customers',
                  icon: '../../../assets/icons/users.svg',
                  isSelected: widget.selectedPage == "customers",
                  onTap: () {
                    widget.onSlectPage("customers");
                    _GoRouter("/customers");
                  },
                ),
                SidebarItem(
                  title: 'Menu',
                  icon: '../../../assets/icons/document.svg',
                  isSelected: widget.selectedPage == "menu",
                  onTap: () {
                    widget.onSlectPage("menu");
                    _GoRouter("/menu");
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
                            overlayColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
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
          ),
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
  final bool isSelected;
  final VoidCallback onTap;

  const SidebarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      height: 20,
                      width: 20,
                      color: isSelected ? Colors.white : Colors.black45,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          color: isSelected ? Colors.white : Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
