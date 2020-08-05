import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/authPage/forgotPwdScreen.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/manageDept/deptManage.dart';
import 'package:dic2_project_trans/screens/pMoney/transfertHistoric.dart';
import 'package:flutter/material.dart';

class AdminMenuItem extends StatefulWidget {
  final UserData userData;
  AdminMenuItem({this.userData});
  @override
  _AdminMenuItemState createState() => _AdminMenuItemState();
}

class _AdminMenuItemState extends State<AdminMenuItem> {
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
                                          return ManageDept();
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
                                          return TransfertHistoricCompta();
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
                                  "Comptabilité",
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
                                onPressed: () {},
                                color: Colors.white,
                                icon: Icon(
                                  Icons.clear_all,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Menu 3",
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70,
                    // width: 85,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.green,
                                child: Text(
                                  "Réinitialiser",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ForgotPwdScreen(
                                            jobFunction: "Admin",
                                          );
                                        },
                                        fullscreenDialog: true,
                                      ));
                                },
                              ),
                              // IconButton(
                              //   onPressed: () {},
                              //   color: Colors.white,
                              //   icon: Icon(
                              //     Icons.description,
                              //     size: 20,
                              //   ),
                              // ),
                              // Center(
                              //   child: Text(
                              //     'Département',
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              // )
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
    }
  }
}
