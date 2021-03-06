import 'package:dic2_project_trans/screens/home/menuItem/presenceList.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
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
                                Icons.dashboard,
                                size: 17,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_balance, color: Colors.white),
                        Text(
                          'Menu 2',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.credit_card,
                          color: Colors.white,
                        ),
                        Text(
                          'Menu 3',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
