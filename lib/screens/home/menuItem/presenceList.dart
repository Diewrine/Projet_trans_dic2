import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PresenceList extends StatefulWidget {
  @override
  _PresenceListState createState() => _PresenceListState();
}

class _PresenceListState extends State<PresenceList> {
  QuerySnapshot presenceList;
  DatabaseService databaseService = new DatabaseService();
  //----------------------
  int itemsCount;
  String _currentDate;

  @override
  void initState() {
    databaseService.listPresence().then((results) {
      setState(() {
        presenceList = results;
        itemsCount = results.documents.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Présence"),
      ),
      body: _listPresence(),
    );
  }

  Widget _listPresence() {
    if (presenceList != null) {
      return SingleChildScrollView(
        child: DataTable(
            columns: [
              DataColumn(label: Text("Fulname")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("pointage")),
            ],
            rows: presenceList.documents.toList().map((e) {
              setState(() {
                dynamic result =
                    DateTime.parse(e.data["entryDate"].toDate().toString());
                _currentDate = new DateFormat.Hms().format(result);
                print(_currentDate);
              });

              return DataRow(cells: [
                DataCell(
                  Text(e.data['fullname'] ?? " "),
                ),
                DataCell(
                  Text(e.data['prensence'] ?? " "),
                ),
                DataCell(
                  Text(_currentDate ?? " "),
                )
              ]);
            }).toList()),
      );
    } else {
      return Loading2();
    }
  }
}
