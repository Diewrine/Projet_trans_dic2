import 'dart:io';

import 'package:dic2_project_trans/screens/home/homePageWidget.dart';
import 'package:dic2_project_trans/screens/home/widgets/bottomNav.dart';
import 'package:dic2_project_trans/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  // Instance of authService
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text(
        //   'Profile',
        //   style: TextStyle(color: Colors.white),
        // ),
        elevation: 0.0,
        backgroundColor: Colors.indigo[500],
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            size: 27,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton.icon(
            label: Text(
              "Quitter",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            icon: Icon(
              // Icons.arrow_back_ios,
              Icons.exit_to_app,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: HomePage(),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }
}
