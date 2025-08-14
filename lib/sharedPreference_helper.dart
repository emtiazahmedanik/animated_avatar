// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  
  static const String avatarKey = 'avatar';

  Future<void> saveAvatar(String avatar) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(avatarKey, avatar);
  }

  Future<String?> getAvatar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(avatarKey);
  }
}