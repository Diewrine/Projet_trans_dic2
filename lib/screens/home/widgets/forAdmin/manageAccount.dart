import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class ManageAccount extends StatefulWidget {
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  QuerySnapshot usersList;
  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    databaseService.listUserForAdmin().then((results) {
      setState(() {
        usersList = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des comptes"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 27,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _usersList(),
    );
  }

  Widget _usersList() {
    if (usersList != null) {
      return ListView.builder(
        itemCount: usersList.documents.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          return Card(
            child: new ListTile(
              title: Text(
                usersList.documents[i].data["fullname"],
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                usersList.documents[i].data["jobFunction"],
              ),
              leading: (usersList.documents[i].data["urlPhoto"] == null)
                  ? Image.asset("assets/iconProfil.png")
                  : Image.network(
                      usersList.documents[i].data["urlPhoto"],
                    ),
              trailing: RaisedButton(
                onPressed: () async {
                  dynamic result = await databaseService
                      .manageAccount(usersList.documents[i].data["uid"]);

                  if (result != null) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageAccount()),
                    );
                  }
                },
                color: (usersList.documents[i].data["acountActivated"])
                    ? Colors.redAccent
                    : Colors.greenAccent,
                child: (usersList.documents[i].data["acountActivated"])
                    ? Text("Désactiver")
                    : Text("Activer"),
              ),
              onTap: () {
                _showMyDialog(usersList.documents[i]);
              },
            ),
          );
        },
      );
    } else {
      return Loading2();
    }
  }

  Future<void> _showMyDialog(DocumentSnapshot doc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('A propos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('fullname',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  doc.data["fullname"] ?? "non renseigné",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Fonction',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  doc.data["jobFunction"] ?? "non renseigné",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Département',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(doc.data["dept"] ?? " ... ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('classe',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(doc.data["classe"] ?? " ... ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
