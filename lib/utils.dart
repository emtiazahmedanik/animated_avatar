// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:myanimationavator/profile.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// /// Load an HTML file from assets into a WebView
// Future<void> loadHtmlFromAssets(
//   WebViewController controller,
//   String asset,
// ) async {
//   final String fileText = await rootBundle.loadString(asset);
//   await controller.loadHtmlString(fileText);
// }

// /// Retrieve the saved avatar data from SharedPreferences
// ProfileData? userFromPrefs(SharedPreferences prefs) {
//   final String? avatarJson = prefs.getString('avatar');
//   if (avatarJson == null || avatarJson.trim().isEmpty) return null;

//   try {
//     final Map<String, dynamic> json = jsonDecode(avatarJson);
//     if (json.isNotEmpty) {
//       final String? avatarUrl = json['data']?['url'];
//       final String? avatarId = avatarUrl
//           ?.split('/')
//           .last
//           .replaceAll('.glb', '')
//           .trim();

//       return ProfileData(
//         avatarId,
//         avatarUrl: avatarUrl,
//         name: json['data']?['name'],
//         email: json['data']?['email'],
//       );
//     }
//   } catch (_) {
//     return null;
//   }
//   return null;
// }

// /// Model to store avatar/profile info

