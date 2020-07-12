import 'package:dic2_project_trans/screens/pMoney/etudiantList.dart';
import 'package:dic2_project_trans/services/database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComptaMoney extends StatefulWidget {
  @override
  _ComptaMoneyState createState() => _ComptaMoneyState();
}

class _ComptaMoneyState extends State<ComptaMoney> {
  DatabaseService databaseService = new DatabaseService();

  String _destinataire = "";
  double montant;
  String _montant = "";
  String _uid;

  //Function
  void receiveName(String name, String uid) {
    setState(() {
      _destinataire = name;
      _uid = uid;
    });
    print(_uid);
  }

  void _showPanel() {
    showModalBottomSheet(
        backgroundColor: Colors.indigo[100],
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            child: EtuList(receiveName: receiveName),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Transfert"),
        backgroundColor: Colors.transparent,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              color: Colors.blue[100],
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/money3.jpg",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                        child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _destinataire,
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Card(
                            color: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.adjust,
                                  size: 25,
                                ),
                                label: Text(
                                  'Destinataire',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () => _showPanel(),
                              ),
                            )),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Card(
                        child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: "Montant ",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _montant = value;
                              });
                            })),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      child: Text(
                        "Transférer",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        montant = num.tryParse(_montant);
                        if (montant != null) {
                          databaseService.treansfertPMoney(
                              _uid, montant.toDouble());
                          setState(() {
                            _destinataire = "";
                          });
                        } else {
                          print("eeeee");
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
