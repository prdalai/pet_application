import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesReadWrite{
  static late SharedPreferences prefs;
   static Future init() async {
     prefs = await SharedPreferences.getInstance();
   }

   static readBool(String key) async{
      return prefs.getBool(key) ?? false;
   }
   static writeBool (String key, bool value) async{
     await prefs.setBool(key, value);
   }

  static readString(String key) {
    return prefs.getString(key) ?? '';
  }
  static List<String> readStringList(String key) {
    return prefs.getStringList(key) ?? [];
  }
  static writeString (String key, String value) async{
    await prefs.setString(key, value);
  }
  static writeStringList (String key, List<String> value) async{
    await prefs.setStringList(key, value);
  }


}