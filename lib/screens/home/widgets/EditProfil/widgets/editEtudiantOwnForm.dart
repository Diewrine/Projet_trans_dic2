import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/constants.dart';
import 'package:flutter/material.dart';

class EditEtudiantOwnForm extends StatefulWidget {
 final  UserData user;
  EditEtudiantOwnForm(this.user);
  @override
  _EditEtudiantOwnFormState createState() =>
      _EditEtudiantOwnFormState(this.user);
}

class _EditEtudiantOwnFormState extends State<EditEtudiantOwnForm> {
  _EditEtudiantOwnFormState(this.user);
  final _formKey = GlobalKey<FormState>();
  UserData user;
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

  String currentFullname;

  String currentDepartment;

  String currentClasse;

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
              decoration: formDecoration,
              initialValue: user.fullname,
              validator: (value) => value.isEmpty ? 'Entrez votre nom' : null,
              onChanged: (val) => setState(() => currentFullname = val),
            ),
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
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                        currentFullname ?? user.fullname,
                        user.jobFunction,
                        currentDepartment ?? user.dept,
                        currentClasse ?? user.classe,
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
