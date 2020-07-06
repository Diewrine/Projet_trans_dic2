import 'package:flutter/material.dart';

class UserProfilView extends StatefulWidget {
  @override
  _UserProfilViewState createState() => _UserProfilViewState();
}

class _UserProfilViewState extends State<UserProfilView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(50.5),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow,
              spreadRadius: 2,
            )
          ]),
      child: Center(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/profil.jpg"),
        ),
      ),
    );
  }
}
