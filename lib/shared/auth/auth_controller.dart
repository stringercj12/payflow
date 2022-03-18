import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;

  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setString("user", user.toString());
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(
      Duration(seconds: 2),
    );

    if (instance.containsKey("user")) {
      final user = instance.get("user") as String;
      setUser(context, user);
    } else {
      setUser(context, null);
    }
  }
}
