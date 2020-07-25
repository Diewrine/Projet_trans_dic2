//import 'package:dic2_project_trans/screens/home/widgets/scan/generateScreen.dart';

import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/widgets/profileImage/imageProfile.dart';
import 'package:dic2_project_trans/screens/home/widgets/scan/scanner.dart';
import 'package:dic2_project_trans/screens/pMoney/etuMoney.dart';
import 'package:flutter/material.dart';

// import '../../editProfil.dart';s

class EtudiantDisplayedPage extends StatefulWidget {
  final bool accountStatus;
  final UserData userData;
  EtudiantDisplayedPage({this.accountStatus, this.userData});
  @override
  _EtudiantDisplayedPageState createState() => _EtudiantDisplayedPageState();
}

class _EtudiantDisplayedPageState extends State<EtudiantDisplayedPage> {
  @override
  Widget build(BuildContext context) {
    final bool accountStatus = widget.accountStatus;
    final UserData user = widget.userData;

    if (accountStatus) {
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage(userData: user)),
                      );
                    },
                    //_showModalPanel,
                  ),
                  Text(
                    "Modifier\nle profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
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
                      icon: Icon(Icons.payment),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scanner()),
                        );
                      }),
                  Text(
                    'Faire un\nscan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
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
                      Icons.attach_money,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return EtuMoney();
                            },
                            fullscreenDialog: true,
                          ));
                    },
                  ),
                  Text(
                    "Polytech\nMoney",
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
    } else {
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage(userData: user)),
                      );
                    },
                    //_showModalPanel,
                  ),
                  Text(
                    "Modifier\nle profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
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
                      icon: Icon(Icons.payment),
                      color: Colors.white,
                      onPressed: () {}),
                  Text(
                    'Faire un\nscan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
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
                      Icons.attach_money,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    "Polytech\nMoney",
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
}
