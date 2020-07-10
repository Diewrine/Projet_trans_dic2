import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/authPage/authPage.dart';
import 'package:dic2_project_trans/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    

    // return either Home or Authentication page
    if (user == null) {
      return AuthPage();
    } else {
      return Home();
    }
  }
}
