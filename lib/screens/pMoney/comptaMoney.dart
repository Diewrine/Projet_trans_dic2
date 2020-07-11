import 'package:dic2_project_trans/screens/pMoney/etudiantList.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComptaMoney extends StatefulWidget {
  @override
  _ComptaMoneyState createState() => _ComptaMoneyState();
}

class _ComptaMoneyState extends State<ComptaMoney> {
  String _destinataire = "hh";
  int montant;
  String _montant;

  void _showPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            child: EtuList(),
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
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('assets/money.jpg'),
                ),
                SizedBox(height: 70.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      child: Column(
                    children: <Widget>[
                      Card(
                        child: Text(
                          _destinataire,
                          style: TextStyle(
                              backgroundColor: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                          color: Colors.indigo[100],
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: FlatButton.icon(
                              icon: Icon(
                                Icons.adjust,
                                size: 25,
                              ),
                              label: Text(
                                'Destinataire',
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
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
                RaisedButton(onPressed: () {
                  montant = num.tryParse(_montant);
                  print(montant);
                })
              ],
            ),
          ),
        ),
      ),
      // body: Center(
      //   child: EtuList(),
      // ),
    );
  }
}
