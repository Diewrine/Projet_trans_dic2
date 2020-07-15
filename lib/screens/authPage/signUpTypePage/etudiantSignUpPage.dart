import 'package:dic2_project_trans/screens/home/home.dart';
import 'package:dic2_project_trans/services/auth.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class EtudiantSignUp extends StatefulWidget {
  final Function toggleView;
  EtudiantSignUp({this.toggleView});
  @override
  _EtudiantSignUpState createState() => _EtudiantSignUpState();
}

class _EtudiantSignUpState extends State<EtudiantSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // for dropdown
  final List<String> departments = [
    "G.I.T.",
    "G.C.",
    "G.E.M.",
    "T.C.",
  ];

  final List<String> classes = [
    "T.C.1",
    "T.C.2",
    "D.I.C.1",
    "D.I.C.2",
    "D.I.C.3",
  ];
  //text Fields
  String email = "";
  String password = "";
  String fullname = "";
  String department = "";
  String classe = "";
  String profilPhoto="assets/profil.jpg";

  // jobFunction
  String jobFunction = "";
  double pMoney = 0;

  // for errors
  String error = "";
  String uid;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.indigo,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Bienvenue! \nCréer votre compte",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Compte etudiant",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 25.0),

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
                                          // TextFormField

                                          child: TextFormField(
                                            //decoration
                                            validator: (value) => value.isEmpty
                                                ? "L'adresse mail est obligatoire"
                                                : null,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            validator: (value) => value.length <
                                                    6
                                                ? "Le mot de passe doit contenir au moins 6 caractères"
                                                : null,
                                            style:
                                                TextStyle(color: Colors.white),
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Password(min 6 caractères) ",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                password = value;
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
                                            style:
                                                TextStyle(color: Colors.white),
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

                                        //--------------for other credentiels

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
                                                hintText: "Département ",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              items: departments.map((dept) {
                                                return DropdownMenuItem(
                                                  value: dept,
                                                  child: Text(
                                                    '$dept',
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String value) {
                                                department = value;
                                              },
                                            ),
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
                                                hintText: "Classe ",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              items: classes.map((classe) {
                                                return DropdownMenuItem(
                                                  value: classe,
                                                  child: Text(
                                                    '$classe',
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String value) {
                                                classe = value;
                                              },
                                            ),
                                          ),
                                        ),

                                        // end of fields
                                        SizedBox(
                                          height: 10.0,
                                        ),

                                        Text(
                                          error,
                                          style: TextStyle(color: Colors.red),
                                        ),

                                        //----------
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: RaisedButton(
                                            color:
                                                Color.fromRGBO(49, 39, 79, 1),
                                            elevation: 0.0,
                                            child: Text(
                                              "Soumettre",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                jobFunction = "Etudiant";
                                              });

                                              if (_formKey.currentState
                                                  .validate()) {
                                                if (department == "" ||
                                                    classe == "") {
                                                  setState(() {
                                                    error =
                                                        'Renseignez votre département \net votre classe svp.';
                                                    loading = false;
                                                  });
                                                } else {
                                                  // setState(() {
                                                  //   error = '';
                                                  //   loading = false;
                                                  // });

                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  dynamic result =
                                                      await _auth.register(
                                                          email,
                                                          password,
                                                          fullname,
                                                          jobFunction,
                                                          department,
                                                          classe,
                                                          pMoney,
                                                          profilPhoto);
                                                  if (result == null) {
                                                    setState(() {
                                                      error =
                                                          'Inscription refusée! \nVérifiez vos données svp';
                                                      loading = false;
                                                    });
                                                  } else {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Home()));
                                                  }
                                                }
                                              }
                                            },
                                          ),
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
