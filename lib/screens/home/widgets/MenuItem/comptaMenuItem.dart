import 'package:flutter/material.dart';

class ComptaMenuItem extends StatefulWidget {
  @override
  _ComptaMenuItemState createState() => _ComptaMenuItemState();
}

class _ComptaMenuItemState extends State<ComptaMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("Compta Menu Item"),
    ));
  }
}
