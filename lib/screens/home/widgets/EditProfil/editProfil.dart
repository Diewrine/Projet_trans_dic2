import 'package:dic2_project_trans/models/user.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editChefDeptProfil.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editComptableOwnProfil.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editEtudiantOwnForm.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editProfOwnProfil.dart';
import 'package:dic2_project_trans/services/database.dart';
// import 'package:dic2_project_trans/shared/constants.dart';
// import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class EditProfil extends StatefulWidget {
  final UserData userData;
  EditProfil({this.userData});
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();
  // final List<String> departments = [
  //   "G.I.T.",
  //   "G.C.",
  //   "G.E.M.",
  //   "T.C.",
  // ];

  // final List<String> classes = [
  //   "T.C.1",
  //   "T.C.2",
  //   "D.I.C.1",
  //   "D.I.C.2",
  //   "D.I.C.3",
  // ];

  String currentFullname;

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    final user = widget.userData;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Modifier votre nom',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: user.fullname,
                    labelText: "fullname",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: user.fullname,
                  validator: (value) =>
                      value.isEmpty ? 'Entrez votre nom' : null,
                  onChanged: (val) => setState(() => currentFullname = val),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      elevation: 4.0,
                      splashColor: Colors.blue,
                      child: Text(
                        'Annuler',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    RaisedButton(
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                                currentFullname ?? user.fullname,
                                user.jobFunction,
                                user.dept,
                                user.classe,
                                user.pMoney,
                                user.urlPhoto,
                                user.accountActivated);
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ],
            )),
      ),
    );

    //  StreamBuilder<UserData>(
    //     stream: DatabaseService(uid: user.uid).userData,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         UserData userData = snapshot.data;
    //         if (userData.jobFunction == 'Etudiant') {
    //           return EditEtudiantOwnForm(userData);
    //         } else if (userData.jobFunction == 'Professeur')
    //           return EditProfProfil(userData);
    //         else if (userData.jobFunction == 'departmentChief')
    //           return EditChefDeptProfil(userData);
    //         else
    //           return EditComptableProfil(userData);
    //       } else {
    //         return Loading();
    //       }
    //     });
  }
}
