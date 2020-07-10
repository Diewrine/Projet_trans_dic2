import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';

class EditProfProfil extends StatefulWidget {
  UserData user;
  EditProfProfil(this.user);
  @override
  _EditProfProfilState createState() => _EditProfProfilState(this.user);
}

class _EditProfProfilState extends State<EditProfProfil> {
  UserData user;
  _EditProfProfilState(this.user);
  final _formKey = GlobalKey<FormState>();

  final List<String> departments = [
    "G.I.T.",
    "G.C.",
    "G.E.M.",
    "T.C.",
  ];

  

  String currentFullname;

  String currentDepartment;


  @override
  Widget build(BuildContext context) {

    
    return Container(
      child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Modifier votre profil',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: user.fullname,
                      validator: (value) =>
                        value.isEmpty ? 'Entrez votre nom' : null,
                      onChanged: (val) => setState(() => currentFullname = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                        value: currentDepartment,
                        items: departments.map((dept) {
                          return DropdownMenuItem(
                            value: dept,
                            child: Text('$dept'),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          currentDepartment = val;
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
              
                    RaisedButton(
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red,
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            await DatabaseService(uid: user.uid).updateUserData(
                            currentFullname ?? user.fullname,
                            user.jobFunction, 
                            currentDepartment ?? user.dept,
                             user.classe, 
                            user.pMoney,
                            user.accountActivated);
                          }
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
    );
  }
}