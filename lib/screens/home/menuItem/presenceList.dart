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
  String _exitDate;

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
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            child: DataTable(
                columns: [
                  DataColumn(label: Text("Fulname")),
                  DataColumn(label: Text("Status")),
                  DataColumn(label: Text("entrée")),
                  DataColumn(label: Text("sortie")),
                ],
                rows: presenceList.documents.toList().map((e) {
                  setState(() {
                    dynamic result =
                        DateTime.parse(e.data["entryDate"].toDate().toString());
                    _currentDate = new DateFormat.Hms().format(result);

                    dynamic result2 = (e.data["exitDate"] != null)
                        ? DateTime.parse(e.data["exitDate"].toDate().toString())
                        : " ";

                    _exitDate = (result2 != " ")
                        ? new DateFormat.Hms().format(result2)
                        : " ";
                  });

                  return DataRow(cells: [
                    DataCell(
                      Text(
                        e.data['fullname'] ?? " ",
                        style: TextStyle(
                            color: (e.data['jobFunction'] == "Professeur")
                                ? Colors.blue
                                : Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        e.data['prensence'] ?? " ",
                        style: TextStyle(
                            color: (e.data['prensence'] == "Present")
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                    DataCell(
                      Text(_currentDate ?? " "),
                    ),
                    DataCell(
                      Text(_exitDate ?? " "),
                    )
                  ]);
                }).toList()),
          ),
        ),
      );
    } else {
      return Loading2();
    }
  }
}
