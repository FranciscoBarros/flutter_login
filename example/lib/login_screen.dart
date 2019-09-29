import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart' as Login;
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Future _loginUser(BuildContext context) {
    return Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
    });
  }

  Future _recoverPassword() {
    return Future.delayed(const Duration(seconds: 8), () {
      // send email
    });
  }

  @override
  Widget build(BuildContext context) {
    return Login.LoginScreen(
      title: 'ECorp',
      logoAsset: 'assets/images/ecorp.png',
      titleTextStyle: (defaultTextStyle) =>
          defaultTextStyle.copyWith(color: Colors.orange),
      emailValidator: (value) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(context);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(context);
      },
      onRecoverPassword: (name) async {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword();
        // Show new password dialog
      },
    );
  }
}
