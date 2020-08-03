import 'package:flutter/material.dart';

class SuperUserMenuItem extends StatefulWidget {
  @override
  _SuperUserMenuItemState createState() => _SuperUserMenuItemState();
}

class _SuperUserMenuItemState extends State<SuperUserMenuItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Text(
            "For the SuperUser",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
