import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static String _keyID = "ID";
  static String _keyName = "Name";
  static String _keyPhone = "PHONE";
  static String _keyPhoto = "PHOTO";
  static String _keyCategory = "TYPE";
  static String _keyStatus = "STATUS";


  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /// Set ID
  static Future setID(String value) async =>
      await _preferences.setString(_keyID, value);
  static String? getID() => _preferences.getString(_keyID);

  /// User type
  static Future setName(String value) async =>
      await _preferences.setString(_keyName, value);
  static String? getName() => _preferences.getString(_keyName);

  /// Phone
  static Future setPhone(String value) async =>
      await _preferences.setString(_keyPhone, value);
  static String? getPhone() => _preferences.getString(_keyPhone);

  /// Phone
  static Future setPhoto(String value) async =>
      await _preferences.setString(_keyPhoto, value);
  static String? getPhoto() => _preferences.getString(_keyPhoto);

  /// Phone
  static Future setCategory(String value) async =>
      await _preferences.setString(_keyCategory, value);
  static String? getCategory() => _preferences.getString(_keyCategory);

  /// Phone
  static Future setStatus(String value) async =>
      await _preferences.setString(_keyStatus, value);
  static String? getStatus() => _preferences.getString(_keyStatus);


  static Future deleteByKey(String value) async {
    await _preferences.remove(value);
  }

  static Future deleteAllData() async {
    await _preferences.clear();
  }

}