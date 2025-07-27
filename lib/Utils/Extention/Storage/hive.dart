import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homzie/Utils/Extention/AES/encrypt.dart';


enum StorageKey { Provider, Profile, Token, IsLogin, IsIntroduction, AddProperty }

// Buat metode getter untuk mengaitkan nilai String dengan setiap enum
extension StorageHeader on StorageKey {
  String get value {
    switch (this) {
      case StorageKey.Provider:
        return 'tiketku';
      case StorageKey.Profile:
        return 'profile';
      case StorageKey.Token:
        return 'token';
      case StorageKey.IsLogin:
        return 'isLogin';
      case StorageKey.IsIntroduction:
        return 'isIntroduction';
      case StorageKey.AddProperty:
        return 'addProperty';
      default:
        return 'Unknown';
    }
  }
}

class Storage {
  static void saveJson(String key, dynamic value) {
    Box box = Hive.box(StorageKey.Provider.value);

    try {
      final encryptValue = EncryptData.encryptAES(jsonEncode(value));

      box.put(key, encryptValue);
    } catch (error) {
      rethrow;
    }
  }

  static void save(String key, String value) {
    Box box = Hive.box(StorageKey.Provider.value);

    try {
      final encryptValue = EncryptData.encryptAES(value.toString());
      box.put(key, encryptValue);
    } catch (error) {
      rethrow;
    }
  }

  static dynamic get(String key) {
    try {
      Box box = Hive.box(StorageKey.Provider.value);
      final value = box.get(key);

      if (value != null && value != "") {
        if (value is bool) {
          return value;
        } else {
          final decryptValue = EncryptData.decryptAES(value);
          return decryptValue;
        }
      } else {
        return "";
      }
    } catch (error) {
      rethrow;
    }
  }

  static void delete(String key) {
    try {
      Box box = Hive.box(StorageKey.Provider.value);
      box.delete(key);
    } catch (error) {
      rethrow;
    }
  }

  static void clearAll() {
    try {
      Box box = Hive.box(StorageKey.Provider.value);
      box.delete(StorageKey.IsLogin.value);
      box.delete(StorageKey.Profile.value);
      box.delete(StorageKey.Token.value);
    } catch (error) {
      rethrow;
    }
  }

  static String getToken() {
    try {
      Box box = Hive.box(StorageKey.Provider.value);
      final encryptedToken = box.get(StorageKey.Token.value);
      if (encryptedToken != null) {
        final token = EncryptData.decryptAES(encryptedToken);
        return token;
      }
      throw "failed get token";
    } catch (error) {
      rethrow;
    }
  }

  static clearToken() {
    try {
      Box box = Hive.box(StorageKey.Provider.value);
      box.delete(StorageKey.Token.value);
    } catch (error) {
      rethrow;
    }
  }
}
