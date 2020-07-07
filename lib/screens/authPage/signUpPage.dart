import 'package:dic2_project_trans/services/auth.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({this.toggleView});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text Fields
  String email = "";
  String password = "";

  // for error
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //resizeToAvoidBottomInset: false,

            backgroundColor: Colors.indigo,
            //backgroundColor: Color(0xff21254a),

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //color: Colors.red,  BoxDecoration
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/1.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Bienvenue!, \nCréer votre compte",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //----------------

                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 25.0),
                            //color: Colors.orange[50],
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
                                              if (_formKey.currentState
                                                  .validate()) {
                                                setState(() {
                                                  loading = true;
                                                });
                                                dynamic result = await _auth
                                                    .register(email, password);
                                                if (result == null) {
                                                  setState(() {
                                                    error =
                                                        'Inscription refusée! \nVérifiez vos données svp';
                                                    loading = false;
                                                  });
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        //Raise Button se Connecter

                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Center(
                                          child: RaisedButton(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            child: Text(
                                              "J'ai déjà un compte",
                                              style: TextStyle(
                                                color: Colors
                                                    .white, //Colors.pink[200],
                                              ),
                                            ),
                                            onPressed: () {
                                              widget.toggleView();
                                            },
                                          ),
                                        ),
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
