import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class CallToActionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: hslToColor(257, 27, 26), // Dark Violet background,
      child: Stack(
        children: [
          // Background SVG positioned behind the content
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/bg-boost-desktop.svg', // Path to your SVG
              fit: BoxFit.cover, // Adjust the SVG to cover the container
            ),
          ),
          // Content: Text and Button
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 32),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Boost your links today',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16), // Space between text and button
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white, // White text on button
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hslToColor(180, 66, 49), // Cyan button color
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
