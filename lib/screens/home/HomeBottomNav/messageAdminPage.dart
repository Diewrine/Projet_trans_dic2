import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot messageInfo;

  @override
  void initState() {
    databaseService.getAdminMessage().then((results) {
      setState(() {
        messageInfo = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Information Scolarité"),
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
      body: SingleChildScrollView(
        child: _getAdminInfo(),
      ),
    );
  }

  Widget _getAdminInfo() {
    if (messageInfo != null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Dernière message de la scolarité",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: Card(
                    child: Text(
                      messageInfo.documents[0].data["object"] ?? " ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  //color: Colors.blue[100],
                  elevation: 0.0,
                  child: Text(
                    messageInfo.documents[0].data["message"] ??
                        "Aucune information pour l'instant.",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Loading();
    }
  }
}
