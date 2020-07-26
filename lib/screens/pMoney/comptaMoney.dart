import 'package:dic2_project_trans/screens/pMoney/etudiantList.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/services/transfertsLog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComptaMoney extends StatefulWidget {
  final String name;
  ComptaMoney({this.name});
  @override
  _ComptaMoneyState createState() => _ComptaMoneyState();
}

class _ComptaMoneyState extends State<ComptaMoney> {
  DatabaseService databaseService = new DatabaseService();
  TransfertsLog _transfertLog = new TransfertsLog();

  var _controller = TextEditingController();

  String _destinataire = "";
  double montant;
  String _montant = "";
  String _uid;

  String text1 = "Opération réussie";
  String text2 = "Le transfert a été fait avec succés.";

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
    final String name = widget.name;

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
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Column(
                          children: <Widget>[
                            Card(
                              color: Colors.blue[100],
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _destinataire,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      height: 1.5,
                                      backgroundColor: Colors.blue[100],
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
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
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
                        montant = double.tryParse(_montant);
                        if (montant != null && _destinataire != "") {
                          dynamic result =
                              databaseService.treansfertPMoney(_uid, montant);

                          if (result != null) {
                            _transfertLog.sendLog(name, _destinataire, montant);
                            _showMyDialog(text1, text2);
                            _controller.clear();
                          } else {
                            print("errorr transfert !!!");
                            setState(() {
                              _destinataire = "";
                            });
                            _controller.clear();
                            _showMyDialog("Echec de l'opération",
                                "Le transfert n'a pas réussi.\nVeuillez remplir tous les champs");
                          }
                        } else {
                          print("error");
                          setState(() {
                            _destinataire = "";
                          });
                          _controller.clear();
                          _showMyDialog("Echec de l'opération",
                              "Le transfert n'a pas réussi.\nVeuillez remplir tous les champs");
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

  Future<void> _showMyDialog(String text1, String text2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Transfert"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  text1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  text2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
