import 'package:dic2_project_trans/models/user.dart';
// import 'package:dic2_project_trans/screens/home/menuItem/presenceList.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/adminMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/comptaMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/deptMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/restoMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/etuMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/profMenuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/MenuItem/superUserMenuItem.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final UserData userData;
  MenuItem({this.userData});
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    final UserData user = widget.userData;
    if (user.jobFunction == "Etudiant") {
      return EtuMenuItemPage(userData: user);
    } else if (user.jobFunction == "Professeur") {
      return ProfMenuItem(userData: user);
    } else if (user.jobFunction == "Comptable") {
      return ComptaMenuItem(userData: user);
    } else if (user.jobFunction == "departmentChief") {
      return DeptMenuItem(userData: user);
    } else if (user.jobFunction == "Admin") {
      return AdminMenuItem(userData: user);
    } else if (user.jobFunction == "Resto") {
      return RestoMenuItem(userData: user);
    } else if (user.jobFunction == "Superuser") {
      return SuperUserMenuItem();
    } else {
      return Loading();
    }
  }
}
