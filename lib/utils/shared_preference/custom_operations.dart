// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CustomOperations {
  //-----------------------------------------------------------//
  //                      SET OPERATIONS                       //
  //-----------------------------------------------------------//

  //OPERATION FOR SAVING LIST IN SHARED PREFERENCE
  void setCustomList(SharedPreferences prefs, String key, List value) {
    String encodedValue = json.encode(value);
    prefs
        .setString(key, encodedValue)
        .whenComplete(() => print("SET CUSTOM LIST OPERATION SUCCESS"));
  }

  //OPERATION FOR SAVING MAP IN SHARED PREFERENCE
  void setCustomMap(SharedPreferences prefs, String key, Map value) {
    String encodedValue = json.encode(value);
    prefs
        .setString(key, encodedValue)
        .whenComplete(() => print("SET CUSTOM MAP OPERATION SUCCESS"));
  }

  //-----------------------------------------------------------//
  //                      GET OPERATIONS                       //
  //-----------------------------------------------------------//

  //OPERATION FOR RETRIEVING LIST IN SHARED PREFERENCE
  List getCustomList(SharedPreferences prefs, String key) {
    String? value = prefs.getString(key);
    List decodedValue = json.decode(value!);
    return decodedValue;
  }

  //OPERATION FOR RETRIEVING MAP IN SHARED PREFERENCE
  Map getCustomMap(SharedPreferences prefs, String key) {
    String? value = prefs.getString(key);
    Map decodedValue = json.decode(value!);
    return decodedValue;
  }

}
