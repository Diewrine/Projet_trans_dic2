import 'package:flutter/material.dart';

class EtudiantDisplayedPage extends StatefulWidget {
  @override
  _EtudiantDisplayedPageState createState() => _EtudiantDisplayedPageState();
}

class _EtudiantDisplayedPageState extends State<EtudiantDisplayedPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 70,
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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Modifier\nle profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70,
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
            child: Padding(
              padding: const EdgeInsets.all(4.5),
              child: Column(
                children: <Widget>[
                  Icon(
                    //Icons.crop_free,
                    //Icons.flip,
                    //Icons.fullscreen,
                    //Icons.sensor_window,
                    Icons.payment,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Faire un\nscan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70,
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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Polytech\nMoney",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
