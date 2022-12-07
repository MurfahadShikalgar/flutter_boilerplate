// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceOperations {

  //-----------------------------------------------------------//
  //                      SET OPERATIONS                       //
  //-----------------------------------------------------------//

  //OPERATION FOR SAVING INTEGER VALUE IN SHARED PREFERENCE
  void setInt(SharedPreferences prefs, String key, int value) {
    prefs
        .setInt(key, value)
        .whenComplete(() => print("SET INT OPERATION SUCCESS"));
  }

  //OPERATION FOR SAVING INTEGER VALUE IN SHARED PREFERENCE
  void setBool(SharedPreferences prefs, String key, bool value) {
    prefs
        .setBool(key, value)
        .whenComplete(() => print("SET BOOL OPERATION SUCCESS"));
  }

  //OPERATION FOR SAVING INTEGER VALUE IN SHARED PREFERENCE
  void setDouble(SharedPreferences prefs, String key, double value) {
    prefs
        .setDouble(key, value)
        .whenComplete(() => print("SET DOUBLE OPERATION SUCCESS"));
  }

  //OPERATION FOR SAVING INTEGER VALUE IN SHARED PREFERENCE
  void setString(SharedPreferences prefs, String key, String value) {
    prefs
        .setString(key, value)
        .whenComplete(() => print("SET STRING OPERATION SUCCESS"));
  }

  //OPERATION FOR SAVING LIST STRING VALUE IN SHARED PREFERENCE
  void setStringList(SharedPreferences prefs, String key, List<String> value) {
    prefs
        .setStringList(key, value)
        .whenComplete(() => print("SET STRING LIST OPERATION SUCCESS"));
  }

  //-----------------------------------------------------------//
  //                      GET OPERATIONS                       //
  //-----------------------------------------------------------//

  //OPERATION FOR RETRIEVING INTEGER VALUE IN SHARED PREFERENCE
  int? getInt(SharedPreferences prefs, String key) {
    int? value = prefs.getInt(key);
    return value;
  }

  //OPERATION FOR RETRIEVING BOOL VALUE IN SHARED PREFERENCE
  bool? getBool(SharedPreferences prefs, String key) {
    bool? value = prefs.getBool(key);
    return value;
  }

  //OPERATION FOR RETRIEVING DOUBLE VALUE IN SHARED PREFERENCE
  double? getDouble(SharedPreferences prefs, String key) {
    double? value = prefs.getDouble(key);
    return value;
  }

  //OPERATION FOR RETRIEVING STRING VALUE IN SHARED PREFERENCE
  String? getString(SharedPreferences prefs, String key) {
    String? value = prefs.getString(key);
    return value;
  }

  //OPERATION FOR RETRIEVING STRING LIST VALUE IN SHARED PREFERENCE
  List? getStringList(SharedPreferences prefs, String key) {
    List? value = prefs.getStringList(key);
    return value;
  }

}
