import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/shortened_link.dart';

class BitlyService {
  final String _bitlyAccessToken = '7b42468897cd50c30a12ea55c0b43a13e05f122c'; // Set your Bitly API key here

  Future<ShortenedLink?> shortenUrl(String longUrl) async {
    final Uri url = Uri.parse('https://api-ssl.bitly.com/v4/shorten');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_bitlyAccessToken',
        },
        body: jsonEncode({'long_url': longUrl}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ShortenedLink(
          originalUrl: longUrl,
          shortUrl: data['link'],
        );
      } else {
        print('Failed to shorten URL: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error shortening URL: $e');
      return null;
    }
  }
}
