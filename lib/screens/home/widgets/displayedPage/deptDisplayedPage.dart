import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/manageAccount.dart';
import 'package:dic2_project_trans/screens/home/widgets/profileImage/imageProfile.dart';
import 'package:flutter/material.dart';

// import '../../editProfil.dart';

class DeptDisplayedPage extends StatefulWidget {
  final bool accountStatus;
  final UserData userData;
  DeptDisplayedPage({this.accountStatus, this.userData});
  @override
  _DeptDisplayedPageState createState() => _DeptDisplayedPageState();
}

class _DeptDisplayedPageState extends State<DeptDisplayedPage> {
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
                      Icons.person_add,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageAccount()),
                      );
                    },
                  ),
                  Text(
                    'Ajouter un\nProf',
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
                      Icons.all_inclusive,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    "Menu\n...",
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
                      Icons.person_add,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    'Ajouter un\nProf',
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
                      Icons.all_inclusive,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Text(
                    "Menu\nDept",
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
