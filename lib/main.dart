import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/shortened_link.dart';
import 'widgets/custom_popup_menu.dart';
import 'widgets/hero_section.dart';
import 'widgets/link_shortener_section.dart';
import 'widgets/shortened_links_section.dart';
import 'widgets/features_section.dart';
import 'widgets/call_to_action_section.dart';
import 'widgets/footer.dart';
import 'utils/color_utils.dart';

void main() {
  runApp(ShortlyApp());
}

class ShortlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shortly',
      theme: ThemeData(
        primaryColor: hslToColor(180, 66, 49), // Cyan
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      home: ShortlyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShortlyHomePage extends StatefulWidget {
  @override
  _ShortlyHomePageState createState() => _ShortlyHomePageState();
}

class _ShortlyHomePageState extends State<ShortlyHomePage> {
  List<ShortenedLink> shortenedLinks = [];

  // Function to add new shortened links to the list
  void addShortenedLink(ShortenedLink link) {
    setState(() {
      shortenedLinks.add(link);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shortly',
          style: TextStyle(
              color: hslToColor(255, 11, 22),
              fontWeight: FontWeight.bold,
              fontSize: 24), // Very Dark Blue
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_rounded, color: hslToColor(255, 11, 22)),
            iconSize: 30,
            onPressed: () {
              // Trigger the popup menu when tapped
              showCustomPopupMenu(context);
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: hslToColor(255, 11, 22)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            LinkShortenerSection(addShortenedLink: addShortenedLink),
            ShortenedLinksSection(links: shortenedLinks),
            FeaturesSection(),
            CallToActionSection(),
            Footer(),
          ],
        ),
      ),
    );
  }

    // Function to show the custom popup menu
  void showCustomPopupMenu(BuildContext context) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    const double menuWidth = 250; // Adjust based on the popup menu width
    final double screenWidth = overlay.size.width;

    // Calculate the horizontal position to center the menu
    final double leftPosition = (screenWidth - menuWidth) / 2;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(leftPosition, 75, leftPosition,
          0), // Horizontally centered, 100px from top
      menuPadding: EdgeInsets.all(0),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.all(20),
          enabled: false,
          child: buildMenu(),
        ),
      ],
    );
  }

}
