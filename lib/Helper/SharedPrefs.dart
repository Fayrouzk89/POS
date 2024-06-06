import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

   String keyUsername = "key_username";
  String get username => _sharedPrefs!.getString(keyUsername) ?? "";
  Future setUsername(String value)async {
   await _sharedPrefs!.setString(keyUsername, value);
   await _sharedPrefs!.commit();
  }

  String keyPassword = "key_password";
  String get password => _sharedPrefs!.getString(keyPassword) ?? "";
  Future setPassword(String value)async {
    await _sharedPrefs!.setString(keyPassword, value);
    await _sharedPrefs!.commit();
  }
// ...
}
