import 'package:dic2_project_trans/models/user.dart';
import 'package:flutter/material.dart';

class ComptaMenuItem extends StatefulWidget {
  final UserData userData;
  ComptaMenuItem({this.userData});
  @override
  _ComptaMenuItemState createState() => _ComptaMenuItemState();
}

class _ComptaMenuItemState extends State<ComptaMenuItem> {
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
                                  Icons.content_paste,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Menu 1',
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
                                  Icons.description,
                                  size: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Menu 2',
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
                                  'Menu 3',
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
