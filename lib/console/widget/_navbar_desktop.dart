import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Khurram',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Lets\'s check your store today',
                style: GoogleFonts.inter(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
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
          const SizedBox(width: 16),
          Container(
            height: 40,
            width: 2,
            color: Colors.grey.shade100,
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset('assets/images/profile.png', height: 48, width: 48,),
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
                style: GoogleFonts.inter(color: Colors.black45, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
