import 'package:flutter/material.dart';

class ProfMenuItem extends StatefulWidget {
  @override
  _ProfMenuItemState createState() => _ProfMenuItemState();
}

class _ProfMenuItemState extends State<ProfMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("Prof Menu Item"),
    ));
  }
}
