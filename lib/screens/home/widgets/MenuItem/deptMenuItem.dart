import 'package:flutter/material.dart';

class DeptMenuItem extends StatefulWidget {
  @override
  _DeptMenuItemState createState() => _DeptMenuItemState();
}

class _DeptMenuItemState extends State<DeptMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("Dept Menu Item"),
    ));
  }
}
