// Custom Menu Widget
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_utils.dart';

Widget buildMenu() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    decoration: BoxDecoration(
      color: hslToColor(257, 27, 26), // Dark Violet background
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    width: 250, // Width of the menu box
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _menuItem('Features'),
        _menuItem('Pricing'),
        _menuItem('Resources'),
        Divider(color: Colors.white30), // Divider between items
        _menuItem('Login'),
        SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
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
        ),
      ],
    ),
  );
}

// Helper for creating each menu item
Widget _menuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
