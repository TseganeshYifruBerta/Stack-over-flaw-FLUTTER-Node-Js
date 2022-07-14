import 'package:dartz/dartz.dart';
import 'package:please/domain/auth/shared_prefrenece_model.dart';
import 'package:please/domain/auth/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  Future<void> setUserSharedPrefence(UserModel sharedPreference) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', sharedPreference.id);
    await prefs.setString('name', sharedPreference.name);
    await prefs.setString('email', sharedPreference.email);
    await prefs.setBool('isAdmin', sharedPreference.isAdmin);
    await prefs.setString('token', sharedPreference.token);
  }

  Future<void> deleteUserSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('id')) {
      prefs.remove('id');
    }
    if (prefs.containsKey('name')) {
      prefs.remove('name');
    }
    if (prefs.containsKey('email')) {
      prefs.remove('email');
    }
    if (prefs.containsKey('token')) {
      prefs.remove('token');
    }
    if (prefs.containsKey('isAdmin')) {
      prefs.remove('isAdmin');
    }
  }

  Future<UserModel> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    UserModel sharedPreferencedUser = UserModel(
        id: prefs.getString('id').toString(),
        name: prefs.getString('name').toString(),
        email: prefs.getString('email').toString(),
        isAdmin: prefs.getBool('isAdmin') as bool,
        token: prefs.getString('token').toString());
    return sharedPreferencedUser;
  }

  Future<String> getSavedUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id') as String;
  }

  Future<String> getSavedUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') as String;
  }

  Future<String> getSavedUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') as String;
  }

  Future<bool> getSavedUserIsAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAdmin') as bool;
  }

  Future<String> getSavedUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') as String;
  }
}
