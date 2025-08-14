import 'package:flutter/material.dart';
import 'package:myanimationavator/profile.dart';
import 'package:myanimationavator/sharedPreference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle, SystemUiOverlayStyle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.prefs});
  final SharedpreferenceHelper prefs;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")
      ..clearCache()
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            debugPrint('WebView error: $error');
          },
        ),
      )
      ..addJavaScriptChannel(
        'AvatarCreated',
        onMessageReceived: (JavaScriptMessage message) async {
          debugPrint("Avatar created: ${message.message}");
          await widget.prefs.saveAvatar(message.message);
          final user = await widget.prefs.getAvatar(); // Your own function
          if (!mounted) return;
          if (user != null) {
            debugPrint("User data: $user");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfileScreen(data: user)),
            // );
          }
        },
      );

    _loadHtmlFromAssets('assets/iframe.html');
  }

  Future<void> _loadHtmlFromAssets(String filePath) async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _controller.loadHtmlString(fileHtmlContents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

// Example placeholder functions & classes
dynamic userFromPrefs(SharedPreferences prefs) {
  // Retrieve and return user object
  final avatar = prefs.getString('avatar');
  return avatar != null ? {'avatar': avatar} : null;
}

class Profile extends StatelessWidget {
  final dynamic data;
  const Profile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(child: Text("User avatar: ${data['avatar']}")),
    );
  }
}
