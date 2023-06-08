import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static String _token = '';

  static String _name = '';

  static String _rol = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get token {
    return _prefs.getString('token') ?? _token;
  }

  static set token(String token) {
    _token = token;
    _prefs.setString('token', token);
  }
  
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }
  
  static String get rol {
    return _prefs.getString('rol') ?? _rol;
  }

  static set rol(String rol) {
    _rol = rol;
    _prefs.setString('rol', rol);
  }

}
