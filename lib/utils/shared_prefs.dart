import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  // Title
  String get city => _sharedPrefs.getString(keyCity) ?? "Selecciona una opción";
  set city(String value) {
    _sharedPrefs.setString(keyCity, value);
  }

  // // Pass
  // int get pass => _sharedPrefs.getInt(keyPass) ?? 0;
  // set pass(int value){
  //   _sharedPrefs.setInt(keyPass, value);
  // }
  //
  // // Newsletter
  // bool get newsletter => _sharedPrefs.getBool(keyNewsletter) ?? false;
  // set newsletter(bool value){
  //   _sharedPrefs.setBool(keyNewsletter, value);
  // }
}

// Constants
const String keyCity = "key_city";
// const String keyUsername = "key_userName";
// const String keyPass = "key_pass";
// const String keyNewsletter = "key_newsletter";