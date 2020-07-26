import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/menuItem/presenceList.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/deptMenuItem/userDeptList.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/manageDept/showDeptInfo.dart';
import 'package:flutter/material.dart';

class ProfMenuItem extends StatefulWidget {
  final UserData userData;
  ProfMenuItem({this.userData});
  @override
  _ProfMenuItemState createState() => _ProfMenuItemState();
}

class _ProfMenuItemState extends State<ProfMenuItem> {
  @override
  Widget build(BuildContext context) {
    final UserData user = widget.userData;

    if (user.accountActivated) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 85,
                    decoration: BoxDecoration(
                        color: Colors.indigo[500],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 6,
                              blurRadius: 4)
                        ]),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return PresenceList();
                                        },
                                        fullscreenDialog: true,
                                      ));
                                },
                                color: Colors.white,
                                icon: Icon(
                                  Icons.content_paste,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Présence',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 85,
                    decoration: BoxDecoration(
                        color: Colors.indigo[500],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 6,
                              blurRadius: 4)
                        ]),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ShowDeptInfo(
                                            userData: user,
                                          );
                                        },
                                        fullscreenDialog: true,
                                      ));
                                },
                                color: Colors.white,
                                icon: Icon(
                                  Icons.description,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Département',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 85,
                    decoration: BoxDecoration(
                        color: Colors.indigo[500],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 6,
                              blurRadius: 4)
                        ]),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return UserDeptList(
                                              user: user, option: "Etudiant");
                                        },
                                        fullscreenDialog: true,
                                      ));
                                },
                                color: Colors.white,
                                icon: Icon(
                                  Icons.import_contacts,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Etudiants',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Votre compte n'est pas activé.\n\nCertaines restrictions ont été appliquées.",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      );
    }
  }
}
