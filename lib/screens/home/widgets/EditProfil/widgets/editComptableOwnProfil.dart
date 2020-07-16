import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/constants.dart';
import 'package:flutter/material.dart';

class EditComptableProfil extends StatefulWidget {
  //----------------------
  final UserData user;
  EditComptableProfil(this.user);
  @override
  _EditComptableProfilState createState() =>
      _EditComptableProfilState(this.user);
}

class _EditComptableProfilState extends State<EditComptableProfil> {
  _EditComptableProfilState(this.user);
  UserData user;
  String currentFullname;
  final _formKey = GlobalKey<FormState>();
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
              height: 10.0,
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
                        user.dept,
                        user.classe,
                        user.pMoney,
<<<<<<< HEAD
                        user.accountActivated,
                        user.profilPhoto);
=======
                        user.urlPhoto,
                        user.accountActivated);
>>>>>>> 67440c4855c22ff95eea4619e62d960c799ed7cb
                  }
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
