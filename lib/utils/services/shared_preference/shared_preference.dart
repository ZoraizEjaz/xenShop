import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreference {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key)==null){
      return null;
    }else{
      return json.decode(prefs.getString(key)!);
    }
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}