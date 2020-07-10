import 'package:flutter/material.dart';

class ComptaDisplayedPage extends StatefulWidget {
  @override
  _ComptaDisplayedPageState createState() => _ComptaDisplayedPageState();
}

class _ComptaDisplayedPageState extends State<ComptaDisplayedPage> {
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
                    Icons.security,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'AutreMenu un\nCompta',
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
                    "Transfert\npMoney",
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
