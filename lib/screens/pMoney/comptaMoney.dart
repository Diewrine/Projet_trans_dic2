import 'package:dic2_project_trans/screens/pMoney/changePwd.dart';
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

  var _controller1 = TextEditingController();

  var _controller3 = TextEditingController();

  String _destinataire = "";
  double montant;
  String _montant = "";
  String _uid;
  String erreur = " ";

  String pwd;

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
    // final String name = widget.name;

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
        actions: <Widget>[
          FlatButton.icon(
            label: Text(
              "Mot de passe",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            icon: Icon(
              // Icons.arrow_back_ios,
              Icons.enhanced_encryption,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ChangePWD();
                    },
                    fullscreenDialog: true,
                  ));
            },
          ),
        ],
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
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        erreur,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    child: Card(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: TextField(
                                enabled: false,
                                textAlign: TextAlign.center,
                                decoration: new InputDecoration(
                                  hintText: _destinataire,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
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
                                      'Choisir destinataire',
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                        controller: _controller1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Montant ",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _montant = value;
                          });
                        }),
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
                          _showMyDialog(_destinataire, _montant);
                          _controller1.clear();

                          setState(() {
                            _destinataire = "";
                          });
                        } else {
                          print("error");
                          _controller1.clear();

                          setState(() {
                            _destinataire = "";
                          });

                          _showMyDialog2("Echec de l'opération",
                              "Le transfert ne peut pas être fait.\n\nVeuillez remplir tous les champs");
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
          title: Text("Confirmez le transfert"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Vous allez faire un transfert de: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text("\n à : \n",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Entrez votre mot de passe pour confirmer",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                TextField(
                  controller: _controller3,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.number,
                  //enabled: false,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: new InputDecoration(
                    hintText: "mot de passe",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pwd = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
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
            FlatButton(
              child: Text('Confirmer'),
              onPressed: () async {
                _controller3.clear();

                if (pwd != null) {
                  dynamic result = await databaseService.treansfertPMoney(
                      _uid, montant, pwd);

                  if (result != null) {
                    setState(() {
                      pwd = null;
                    });
                    _transfertLog.sendLog(text1, _destinataire, montant);

                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      pwd = null;
                      erreur = "Mot de passe incorrect";
                    });
                    print("errorr transfert !!!");
                    Navigator.of(context).pop();
                  }
                } else {
                  setState(() {
                    pwd = null;
                    erreur = "Veuillez renseigner le mot de passe";
                  });
                  print("errorr mot de passe non renseigné!!!");
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  //------------------------------
  Future<void> _showMyDialog2(String text1, String text2) async {
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
                SizedBox(
                  height: 15,
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
