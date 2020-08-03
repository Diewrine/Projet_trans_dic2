import 'package:dic2_project_trans/screens/home/superUser/addAccount.dart';
import 'package:flutter/material.dart';

class SuperUserPage extends StatefulWidget {
  @override
  _SuperUserPageState createState() => _SuperUserPageState();
}

class _SuperUserPageState extends State<SuperUserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      Icons.person_add,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return AddAccount();
                            },
                            fullscreenDialog: true,
                          ));
                    },
                    //_showModalPanel,
                  ),
                  Text(
                    "Ajouter\nun compte",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
