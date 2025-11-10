import 'package:deeplinking/view/detailsview.dart';
import 'package:deeplinking/view/homeview.dart';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _initDeepLinks();
  }

  Future<void> _initDeepLinks() async {
    // ✅ Updated: use getInitialLink() instead of getInitialAppLink()
    final Uri? initialUri = await _appLinks.getInitialLink();
    _handleDeepLink(initialUri);

    // Listen for incoming links while the app is running
    _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri? uri) {
    if (uri == null) return;
    debugPrint('Received deep link: $uri');

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'details') {
      final id = uri.pathSegments.length > 1 ? int.tryParse(uri.pathSegments[1]) ?? 0 : 0;
      final name = uri.pathSegments.length > 2 ? uri.pathSegments[2] : 'Unknown';

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsView(userId: id, userName: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Links Example',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
