import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/bitly_service.dart';
import '../models/shortened_link.dart';
import '../utils/color_utils.dart';

class LinkShortenerSection extends StatefulWidget {
  final Function(ShortenedLink) addShortenedLink;

  LinkShortenerSection({required this.addShortenedLink});

  @override
  _LinkShortenerSectionState createState() => _LinkShortenerSectionState();
}

class _LinkShortenerSectionState extends State<LinkShortenerSection> {
  final _urlController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  // Bitly API service
  final BitlyService _bitlyService = BitlyService();

  Future<void> _shortenUrl() async {
    final String longUrl = _urlController.text;

    if (longUrl.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a URL';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final shortenedLink = await _bitlyService.shortenUrl(longUrl);

    if (shortenedLink != null) {
      widget.addShortenedLink(shortenedLink);
      _urlController.clear();
    } else {
      setState(() {
        _errorMessage = 'Failed to shorten the URL';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: hslToColor(257, 27, 26), // Dark Violet background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/bg-boost-desktop.svg', // Path to your SVG
              fit: BoxFit.contain, // Adjust the SVG to cover the container
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: 'Shorten a link here...',
                  hintStyle: TextStyle(color: hslToColor(257, 7, 63)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _shortenUrl,
                      child: Text(
                        'Shorten It!',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            hslToColor(180, 66, 49), // Cyan button color
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
