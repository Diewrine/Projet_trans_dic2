import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class TransfertHistoricCompta extends StatefulWidget {
  @override
  _TransfertHistoricComptaState createState() =>
      _TransfertHistoricComptaState();
}

class _TransfertHistoricComptaState extends State<TransfertHistoricCompta> {
  QuerySnapshot logsList;

  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    databaseService.getLogs().then((results) {
      setState(() {
        logsList = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Historique des transfert"),
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
      body: Center(child: _logsList()),
    );
  }

  Widget _logsList() {
    if (logsList != null) {
      return ListView.builder(
        itemCount: logsList.documents.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(logsList.documents[i].data["montant"].toString()),
            subtitle: Text(logsList.documents[i].data["sendBy"] +
                "   " +
                "->" +
                "   " +
                logsList.documents[i].data["receiver"]),
          );
        },
      );
    } else {
      return Loading2();
    }
  }
}
