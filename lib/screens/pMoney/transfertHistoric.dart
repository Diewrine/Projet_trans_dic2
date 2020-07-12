import 'package:flutter/material.dart';

class TransfertHistoricCompta extends StatefulWidget {
  @override
  _TransfertHistoricComptaState createState() =>
      _TransfertHistoricComptaState();
}

class _TransfertHistoricComptaState extends State<TransfertHistoricCompta> {
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
      body: Center(child: Text("Historic")),
    );
  }
}
