import 'dart:io';

import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditChefDeptProfil extends StatefulWidget {
  //---------------------
  final UserData user;
  EditChefDeptProfil(this.user);
  @override
  _EditChefDeptProfilState createState() => _EditChefDeptProfilState(this.user);
}

class _EditChefDeptProfilState extends State<EditChefDeptProfil> {
  UserData user;
  _EditChefDeptProfilState(this.user);
  final _formKey = GlobalKey<FormState>();
  File newProfilImage;
  final picker = ImagePicker();
  Future getImageProfil() async {
    final tempImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      newProfilImage = File(tempImage.path);
    });
  }

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
              decoration: formDecoration,
              initialValue: user.fullname,
              validator: (value) => value.isEmpty ? 'Entrez votre nom' : null,
              onChanged: (val) => setState(() => currentFullname = val),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Departement ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
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
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                        currentFullname ?? user.fullname,
                        user.jobFunction,
                        currentDepartment ?? user.dept,
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
