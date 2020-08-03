// import 'package:dic2_project_trans/screens/authPage/loginPage.dart';
import 'package:dic2_project_trans/services/auth.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPwdScreen extends StatefulWidget {
  final String jobFunction;
  ForgotPwdScreen({this.jobFunction});
  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  DatabaseService databaseService = new DatabaseService();
  final AuthService _auth = AuthService();

  String email;

  final _formKey = GlobalKey<FormState>();

  String message =
      "Cliquer sur le lien que vous recevrez par mail\npour changer votre mot de passe.";
  @override
  Widget build(BuildContext context) {
    String jobFunction = widget.jobFunction;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Changer mot de passe"),
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
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "SVP entrez votre email";
                        } else {
                          email = value;
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email);

                          if (jobFunction == "Admin" ||
                              jobFunction == "Resto") {
                            databaseService.activateAccount();
                            await _auth.signOut();
                          } else {
                            print("nothing");
                          }
                          setState(() {
                            message =
                                "Consultez votre email pour continuer la procedure .";
                          });
                        }
                      },
                      child: Text("Envoyer mail"),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
