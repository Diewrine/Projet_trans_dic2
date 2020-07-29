import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePWD extends StatefulWidget {
  @override
  _ChangePWDState createState() => _ChangePWDState();
}

class _ChangePWDState extends State<ChangePWD> {
  DatabaseService databaseService = new DatabaseService();

  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  String pwd;
  String pwd1;
  String pwd2;

  String erreur = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: AlertDialog(
          title: Text("Mot de passe"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Modifier votre mot de passe",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _controller1,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.number,
                  //enabled: false,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: new InputDecoration(
                    hintText: "Actuel mot de passe",
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
                //---------------------
                TextField(
                  controller: _controller2,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: new InputDecoration(
                    hintText: "Nouveau mot de passe",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pwd1 = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //-------------------------
                TextField(
                  controller: _controller3,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  decoration: new InputDecoration(
                    hintText: "Confirmer mot de passe",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pwd2 = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                SizedBox(
                  height: 10.0,
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
                //************************
                if (pwd == null || pwd1 == null || pwd2 == null) {
                  _controller1.clear();
                  _controller2.clear();
                  _controller3.clear();
                  setState(() {
                    erreur = "Veuillez remplir tous les champs.";
                  });
                }
                //--------------------
                else {
                  if (pwd1 != pwd2) {
                    _controller2.clear();
                    _controller3.clear();
                    setState(() {
                      erreur = "Les mots de passe ne correspondent pas.";
                    });
                  } else {
                    dynamic result =
                        await databaseService.changePassword(pwd, pwd2);
                    //................
                    if (result != null) {
                      Navigator.pop(context);
                    } else {
                      _controller1.clear();
                      _controller2.clear();
                      _controller3.clear();
                      setState(() {
                        erreur = "Le mot de passe est incorrect.";
                      });
                    }

                    //...............
                  }

                  //-------------------------
                }

                //*******************
              },
            ),
          ],
        ));
  }
}
