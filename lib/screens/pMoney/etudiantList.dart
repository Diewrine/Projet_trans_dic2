import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class EtuList extends StatefulWidget {
  final Function receiveName;
  EtuList({this.receiveName});
  @override
  _EtuListState createState() => _EtuListState();
}

class _EtuListState extends State<EtuList> {
  QuerySnapshot etuList;

  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    databaseService.getEtuList().then((results) {
      setState(() {
        etuList = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: _etuList(),
    );
  }

  Widget _etuList() {
    if (etuList != null) {
      return ListView.builder(
        itemCount: etuList.documents.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(etuList.documents[i].data["fullname"]),
            subtitle: Text(etuList.documents[i].data["classe"]),
            leading: Image.asset("assets/avatar.jpg"),
            onTap: () {
              final name = etuList.documents[i].data["fullname"];
              final uid = etuList.documents[i].data["uid"];
              widget.receiveName(name, uid);
              Navigator.pop(context);
            },
          );
        },
      );
    } else {
      return Loading2();
    }
  }
}
