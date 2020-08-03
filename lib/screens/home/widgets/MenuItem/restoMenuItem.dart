import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/authPage/forgotPwdScreen.dart';

import 'package:flutter/material.dart';

class RestoMenuItem extends StatefulWidget {
  final UserData userData;
  RestoMenuItem({this.userData});
  @override
  _RestoMenuItemState createState() => _RestoMenuItemState();
}

class _RestoMenuItemState extends State<RestoMenuItem> {
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
                                onPressed: () {},
                                color: Colors.white,
                                icon: Icon(
                                  Icons.description,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Menu3',
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
                                  Icons.content_paste,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  '...',
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
                                  '.....',
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
                                            jobFunction: "Resto",
                                          );
                                        },
                                        fullscreenDialog: true,
                                      ));
                                },
                              ),
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
