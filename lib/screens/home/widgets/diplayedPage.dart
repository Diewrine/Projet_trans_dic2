import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/widgets/displayedPage/adminDisplayPage.dart';
import 'package:dic2_project_trans/screens/home/widgets/displayedPage/comptaDisplayedPage.dart';
import 'package:dic2_project_trans/screens/home/widgets/displayedPage/deptDisplayedPage.dart';
import 'package:dic2_project_trans/screens/home/widgets/displayedPage/etuDisplayedPage.dart';
import 'package:dic2_project_trans/screens/home/widgets/displayedPage/profDisplayedPage.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class DisplayedPage extends StatefulWidget {
  final String joFunction;
  final String uid;
  final String name;
  final bool accountStatus;
  final UserData userData;
  DisplayedPage(
      {this.joFunction,
      this.uid,
      this.name,
      this.accountStatus,
      this.userData});
  @override
  _DisplayedPageState createState() => _DisplayedPageState();
}

class _DisplayedPageState extends State<DisplayedPage> {
  @override
  Widget build(BuildContext context) {
    final String userJob = widget.joFunction;
    final String userUid = widget.uid;
    final String name = widget.name;
    final bool accountStatus = widget.accountStatus;
    final UserData user = widget.userData;
    if (userJob == "Etudiant") {
      return EtudiantDisplayedPage(
          accountStatus: accountStatus, userData: user);
    } else if (userJob == "Professeur") {
      return ProfDisplayedPage(accountStatus: accountStatus, userData: user);
    } else if (userJob == "Comptable") {
      return ComptaDisplayedPage(uid: userUid, name: name);
    } else if (userJob == "departmentChief") {
      return DeptDisplayedPage(accountStatus: accountStatus, userData: user);
    } else if (userJob == "Admin") {
      return AdminPage(userData: user);
    } else {
      return Loading();
    }
  }
}

// import 'package:dic2_project_trans/shared/loading.dart';
// import 'package:flutter/material.dart';

// class EtudiantDisplayedPage extends StatefulWidget {
//   final String joFunction;
//   EtudiantDisplayedPage({this.joFunction});

//   @override
//   _EtudiantDisplayedPageState createState() => _EtudiantDisplayedPageState();
// }

// class _EtudiantDisplayedPageState extends State<EtudiantDisplayedPage> {
//   @override
//   Widget build(BuildContext context) {
//     final String userJob = widget.joFunction;
//     if (userJob == "Etudiant") {
//       return EtudiantDisplayedPage();
//     } else if (userJob == "Professeur") {
//       return Text("Professeur");
//     } else if (userJob == "Comptable") {
//       return Text("Comptable");
//     } else if (userJob == "departmentChief") {
//       return Text("departmentChief");
//     } else {
//       Loading();
//     }
//   }
// }
