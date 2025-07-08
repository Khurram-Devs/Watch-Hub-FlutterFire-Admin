import 'dart:ui';

import 'package:adminside/console/widget/chart_column.dart';
import 'package:adminside/console/widget/chart_radial.dart';
import 'package:adminside/feature/model/chart_column_data.dart';
import 'package:adminside/feature/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPageMobile extends StatelessWidget {
  const DashboardPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                Image.asset(
                  '../../../../assets/images/header_dashboard_bg.jpg',
                  height: 300,
                  width: screenWidth,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30,
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 180,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      if (index >= data.length) return const SizedBox();
                      return Card(
                        shadowColor: Colors.black26,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                color: Colors.white.withAlpha(128),
                              ),
                            ),
                            Positioned(
                              top: 24,
                              left: 24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(data[index].icon),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    data[index].title,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data[index].num,
                                    style: GoogleFonts.inter(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              shadowColor: Colors.black26,
              surfaceTintColor: Colors.transparent,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height:
                    screenWidth > 1800
                        ? 520
                        : screenWidth < 1550
                        ? 420
                        : 520,
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Revenue",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Divider(
                      height: 0,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "\$32,270",
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Expanded(child: ChartColumn()),
                    const SizedBox(height: 20),
                    Row(
                      children:
                          List.generate(
                            legendItemsColumn.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: LinearGradient(
                                        colors: [
                                          legendItemsColumn[index].color
                                              .withAlpha(128),
                                          legendItemsColumn[index].color,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    legendItemsColumn[index].title,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              shadowColor: Colors.black26,
              surfaceTintColor: Colors.transparent,
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height:
                    screenWidth > 1800
                        ? 520
                        : screenWidth < 1550
                        ? 420
                        : 520,
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customers",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Customers that buy our products",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      height: 0,
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    Expanded(child: ChartRadial()),
                    const SizedBox(height: 20),
                    Row(
                      children:
                          List.generate(
                            legendItemsRadial.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      gradient: LinearGradient(
                                        colors: [
                                          legendItemsRadial[index].color
                                              .withAlpha(128),
                                          legendItemsRadial[index].color,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    legendItemsRadial[index].title,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
