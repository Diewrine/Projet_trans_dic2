import 'package:dic2_project_trans/screens/home/homePageWidget.dart';
import 'package:dic2_project_trans/screens/home/widgets/bottomNav.dart';
import 'package:dic2_project_trans/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Instance of authService
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo[500],
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            size: 27,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton.icon(
            label: Text(
              "Quitter",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            icon: Icon(
              // Icons.arrow_back_ios,
              Icons.exit_to_app,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              _showMyDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: HomePage(),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }

  //-------

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Déconnexion",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Voulez-vous votre quitter session ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text('Retour'),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text('Déconnexion'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
