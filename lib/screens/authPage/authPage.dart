import 'package:dic2_project_trans/screens/authPage/loginPage.dart';
import 'package:dic2_project_trans/screens/authPage/signUpPage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool ShowLogin = true;
  void toggleView() {
    setState(() {
      ShowLogin = !ShowLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowLogin) {
      return LoginPage(toggleView: toggleView);
    } else {
      return SignUpPage(toggleView: toggleView);
    }
  }
}
