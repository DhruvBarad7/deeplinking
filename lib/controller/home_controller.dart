import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController {
  Future<void> launchExternalURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // ✅ important!
    )) {
      debugPrint('Could not launch $url');
    }
  }
}
