// import 'package:dic2_project_trans/models/user.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editChefDeptProfil.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editComptableOwnProfil.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editEtudiantOwnForm.dart';
// import 'package:dic2_project_trans/screens/home/widgets/EditProfil/widgets/editProfOwnProfil.dart';
// import 'package:dic2_project_trans/services/database.dart';
// import 'package:dic2_project_trans/shared/loading.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class EditProfil extends StatefulWidget {
//   @override
//   _EditProfilState createState() => _EditProfilState();
// }

// class _EditProfilState extends State<EditProfil> {

//   final List<String> departments = [
//     "G.I.T.",
//     "G.C.",
//     "G.E.M.",
//     "T.C.",
//   ];

//   final List<String> classes = [
//     "T.C.1",
//     "T.C.2",
//     "D.I.C.1",
//     "D.I.C.2",
//     "D.I.C.3",
//   ];

//   String currentFullname;

//   String currentDepartment;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);
//     return StreamBuilder<UserData>(
//         stream: DatabaseService(uid: user.uid).userData,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             UserData userData = snapshot.data;
//             if (userData.jobFunction == 'Etudiant') {
//               return EditEtudiantOwnForm(userData);
//             } else if (userData.jobFunction == 'Professeur')
//               return EditProfProfil(userData);
//             else if (userData.jobFunction == 'departmentChief')
//               return EditChefDeptProfil(userData);
//             else
//               return EditComptableProfil(userData);
//           } else {
//             return Loading();
//           }
//         });
//   }
// }
