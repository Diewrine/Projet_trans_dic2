import 'package:dic2_project_trans/screens/pMoney/comptaMoney.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PwdSettings extends StatefulWidget {
  final String password;
  final String name;
  PwdSettings({this.password, this.name});
  @override
  _PwdSettingsState createState() => _PwdSettingsState();
}

class _PwdSettingsState extends State<PwdSettings> {
  var _controller = TextEditingController();

  DatabaseService databaseService = new DatabaseService();
  String password1;
  String password2;
  String erreur = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final String name = widget.name;
    final String password = widget.password;
    print(password);

    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Mot de passe"),
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
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),

            //Formulaire
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        // TextFormField
                        Container(
                          padding: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100],
                              ),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value) => value.length != 4
                                ? "Le mot de passe doit contenir 4 caractères"
                                : null,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 5.5,
                                fontWeight: FontWeight.bold),
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mot de passe",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                            onChanged: (value) {
                              setState(() {
                                password1 = value;
                              });
                            },
                          ),
                        ),

                        SizedBox(
                          height: 30.0,
                        ),

                        Container(
                          padding: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100],
                              ),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value) => value.length != 4
                                ? "Le mot de passe doit contenir 4 caractères"
                                : null,
                            controller: _controller,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(4),
                            ],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              letterSpacing: 5.5,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirmer mot de passe",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                            onChanged: (value) {
                              setState(() {
                                password2 = value;
                              });
                            },
                          ),
                        ),
                        // end of fields

                        SizedBox(
                          height: 30.0,
                        ),

                        Center(
                          child: RaisedButton(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            elevation: 0.0,
                            child: Text(
                              "Valider",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _controller.clear();
                                if (password1 != password2 ||
                                    password1 == null) {
                                  setState(() {
                                    erreur =
                                        "Les mots de passe ne correspondent pas";
                                  });
                                } else {
                                  databaseService.updatePassword(password1);

                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ComptaMoney(name: name);
                                        },
                                        fullscreenDialog: true,
                                      ));
                                }
                              } else {
                                print("error");
                              }
                            },
                          ),
                        ),
                        //Raise Button se Connecter
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          erreur,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
