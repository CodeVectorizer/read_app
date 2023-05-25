import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isTokenExpired() async {
  final prefs = await SharedPreferences.getInstance();
  final expiration = prefs.getInt('expiration');

  if (expiration != null) {
    final expirationTime = DateTime.fromMillisecondsSinceEpoch(expiration);
    return DateTime.now().isAfter(expirationTime);
  }

  return true; // Token is considered expired if no expiration time is found
}
