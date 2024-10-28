import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/illustration-working.svg', // Replace with your SVG file path
            height: 270,
          ),
          SizedBox(height: 16),
          Text(
            'More than just shorter links',
            style: GoogleFonts.poppins(
              fontSize: 43,
              fontWeight: FontWeight.bold,
              color: hslToColor(260, 8, 14), // Very Dark Violet
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Build your brand\'s recognition and get detailed insights on how your links are performing.',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: hslToColor(257, 7, 63), // Grayish Violet
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Get Started',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: hslToColor(180, 66, 49), // Cyan
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
