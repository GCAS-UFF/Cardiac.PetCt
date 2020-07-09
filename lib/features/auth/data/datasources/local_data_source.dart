import 'package:petct/core/error/exception.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveUserId(String id);
  Future<String> getUserId();
  Future<void> cleanCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<bool> saveUserId(String id) {
    try {
      return sharedPreferences.setString(Keys.CACHED_USER_ID, id);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String> getUserId() async {
    try {
      return sharedPreferences.getString(Keys.CACHED_USER_ID);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cleanCache() async {
    bool isCleared = await sharedPreferences.clear();
    if (!isCleared) {
      throw CacheException();
    }
  }
}