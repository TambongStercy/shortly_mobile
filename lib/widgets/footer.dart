import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_utils.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: hslToColor(260, 8, 14), // Very Dark Violet background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Shortly',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 34),
          FooterColumn(
            title: 'Features',
            items: ['Link Shortening', 'Branded Links', 'Analytics'],
          ),
          SizedBox(height: 24),
          FooterColumn(
            title: 'Resources',
            items: ['Blog', 'Developers', 'Support'],
          ),
          SizedBox(height: 24),
          FooterColumn(
            title: 'Company',
            items: ['About', 'Our Team', 'Careers', 'Contact'],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(icon: Icons.facebook),
              SizedBox(width: 16),
              SocialIcon(icon: Icons.facebook),
              SizedBox(width: 16),
              SocialIcon(icon: Icons.facebook),
              SizedBox(width: 16),
              SocialIcon(icon: Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }
}

// Footer Column Widget
class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        for (String item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              item,
              style: GoogleFonts.poppins(
                color: Colors.white60, // Light grayish text for list items
              ),
            ),
          ),
      ],
    );
  }
}

// Social Icon Button
class SocialIcon extends StatelessWidget {
  final IconData icon;

  SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.white, size: 28);
  }
}
