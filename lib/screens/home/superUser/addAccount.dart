import 'package:dic2_project_trans/services/auth.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // for dropdown
  final List<String> statusList = [
    "Admin",
    "Resto",
  ];

  //text Fields
  String email = "";

  String fullname = "";
  String status = "";

  // jobFunction
  String jobFunction;
  int pMoney = 0;

  // for error
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0.0,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Créer un nouveau compte",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),

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
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: Colors.indigo,
                                      ),
                                      child: DropdownButtonFormField(
                                        iconEnabledColor: Colors.white,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Status ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        items: statusList.map((statusItem) {
                                          return DropdownMenuItem(
                                            value: statusItem,
                                            child: Text(
                                              '$statusItem',
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String value) {
                                          status = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
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
                                    // TextFormField

                                    child: TextFormField(
                                      //decoration
                                      validator: (value) => value.isEmpty
                                          ? "L'adresse mail est obligatoire"
                                          : null,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),

                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10.0,
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
                                      validator: (value) => value.isEmpty
                                          ? "Ce champ est obligatoire"
                                          : null,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Fullname ",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fullname = value;
                                        });
                                      },
                                    ),
                                  ),

                                  // end of fields
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    error,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        color: Color.fromRGBO(49, 39, 79, 1),
                                        elevation: 0.0,
                                        child: Text(
                                          "Soumettre",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            jobFunction = status;
                                          });

                                          if (_formKey.currentState
                                                  .validate() &&
                                              status != "") {
                                            setState(() {
                                              error = '';
                                            });

                                            //-----------

                                            dynamic result =
                                                await _auth.register(
                                                    email,
                                                    "passer123",
                                                    fullname,
                                                    jobFunction,
                                                    null,
                                                    null,
                                                    0);
                                            if (result == null) {
                                              setState(() {
                                                error =
                                                    'Inscription refusée! \nVérifiez vos données svp';
                                              });
                                            } else {
                                              print("Done");
                                              setState(() {
                                                error =
                                                    "L'ajout a été fait avec succés";
                                              });
                                            }

                                            //----------------
                                          } else {
                                            setState(() {
                                              error =
                                                  'Veuillez indiquer le status';
                                            });
                                            print("errorrrr");
                                          }
                                        }),
                                  ),
                                  //Raise Button se Connecter
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
