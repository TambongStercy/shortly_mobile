import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: hslToColor(0, 0, 95), // Light background color
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Advanced Statistics',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: hslToColor(260, 8, 14), // Very Dark Violet
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Track how your links are performing across the web with our advanced statistics dashboard.',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: hslToColor(257, 7, 63), // Grayish Violet
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 110),
          Stack(
            children: [
              // Vertical line between features
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 8,
                  height: 550,
                  color: hslToColor(180, 66, 49), // Cyan color for vertical line
                ),
              ),
              Column(
                children: [
                  // Feature 1
                  FeatureItem(
                    icon: 'assets/images/icon-brand-recognition.svg',
                    title: 'Brand Recognition',
                    description:
                        'Boost your brand recognition with each click. Generic links don\'t mean a thing. Branded links help instill confidence in your content.',
                  ),
                  SizedBox(height: 90), // Space between items
                  // Feature 2
                  FeatureItem(
                    icon: 'assets/images/icon-detailed-records.svg',
                    title: 'Detailed Records',
                    description:
                        'Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.',
                  ),
                  SizedBox(height: 90), // Space between items
                  // Feature 3
                  FeatureItem(
                    icon: 'assets/images/icon-fully-customizable.svg',
                    title: 'Fully Customizable',
                    description:
                        'Improve brand awareness and content discoverability through customizable links, supercharging audience engagement.',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Feature Item Widget
class FeatureItem extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  FeatureItem({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: hslToColor(260, 8, 14), // Very Dark Violet for text
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: hslToColor(257, 7, 63), // Grayish Violet for text
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // Circular icon with background
          Positioned(
            top: -80,
            left: MediaQuery.of(context).size.width / 2 - 80,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: hslToColor(257, 27, 26), // Dark Violet background
              child: SvgPicture.asset(
                icon, // Replace with your SVG file path
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
