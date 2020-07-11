import 'package:flutter/material.dart';

import '../../editProfil.dart';

class ProfDisplayedPage extends StatefulWidget {
  @override
  _ProfDisplayedPageState createState() => _ProfDisplayedPageState();
}

class _ProfDisplayedPageState extends State<ProfDisplayedPage> {
  @override
  Widget build(BuildContext context) {
    void _showModalPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: EditProfil(),
            );
          });
    }
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  color: Colors.white,
                  onPressed: _showModalPanel,
                ),
                Text(
                  "Modifier\nle profil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  //Icons.crop_free,
                  //Icons.flip,
                  //Icons.fullscreen,
                  //Icons.sensor_window,
                  icon: Icon(
                    Icons.ac_unit,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text(
                  'Menu\nProf',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.assignment,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text(
                  "Gestion\nAbsence",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
