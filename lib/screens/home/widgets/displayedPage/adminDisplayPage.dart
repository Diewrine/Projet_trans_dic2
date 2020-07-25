// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/editProfil.dart';
import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/infoMessage.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/manageAccount.dart';
import 'package:dic2_project_trans/screens/home/widgets/profileImage/imageProfile.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  final UserData userData;
  AdminPage({this.userData});
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final UserData user = widget.userData;
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
                  icon: Icon(
                    Icons.build,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageAccount()),
                    );
                  },
                ),
                Text(
                  'Gestion  \ndes comptes',
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
                    Icons.info,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessageAdmin()),
                    );
                  },
                ),
                Text(
                  "Passer une\ninformation",
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
