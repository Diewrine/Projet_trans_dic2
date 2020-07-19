import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/pMoney/etudiantList.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EtuMoney extends StatefulWidget {
  @override
  _EtuMoneyState createState() => _EtuMoneyState();
}

class _EtuMoneyState extends State<EtuMoney> {
  DatabaseService databaseService = new DatabaseService();
  //-------------------
  String _destinataire = "";
  double montant;
  String _montant = "";
  String _uid;
  String text1 = 'Opération réussie.';
  String text2 = 'Votre transfert a été fait avec succés. Merci !';

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
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              backgroundColor: Colors.blue[100],
              appBar: AppBar(
                // elevation: 0.0,

                title: Text("Transfert"),
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 0.0,
                      color: Colors.blue[100],
                      child: Column(
                        children: <Widget>[
                          // Image.asset(
                          //   "assets/money1.jpg",
                          //   fit: BoxFit.cover,
                          // ),
                          SizedBox(height: 100.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5.0),
                                height: 70,
                                color: Colors.transparent,
                                child: Center(
                                    child: Text(
                                  "Votre Solde\n polytechMoney",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                height: 70,
                                color: Colors.transparent,
                                child: Center(
                                    child: Text(
                                        userData.pMoney.toString() + " pM",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25))),
                              ),
                            ],
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
                                          onPressed: () {
                                            _showPanel();
                                          }),
                                    )),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
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
                              onPressed: () async {
                                montant = double.tryParse(_montant);
                                //-------------
                                if (montant != null && _destinataire != "") {
                                  dynamic result = await databaseService
                                      .etuTreansfertPMoney(_uid, montant);
                                  if (result != null) {
                                    _showMyDialog(text1, text2);
                                  } else {
                                    _showMyDialog("Echec de l'opération",
                                        "\nVotre compte est insuffisant. \n Veuillez rechercher svp!");
                                  }

                                  setState(() {
                                    _destinataire = "";
                                  });
                                } else {
                                  print("eeeee");
                                }

                                //--------------
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
          } else {
            return Loading();
          }
        });
  }

  Future<void> _showMyDialog(String text1, String text2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transfert pMoney'),
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
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EtuMoney();
                      },
                      fullscreenDialog: true,
                    ));
              },
            ),
          ],
        );
      },
    );
  }
}
