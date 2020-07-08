import 'package:dic2_project_trans/screens/authPage/signUpTypePage/comptableSignUpPage.dart';
import 'package:dic2_project_trans/screens/authPage/signUpTypePage/deptSignUpPage.dart';
import 'package:dic2_project_trans/screens/authPage/signUpTypePage/etudiantSignUpPage.dart';
import 'package:dic2_project_trans/screens/authPage/signUpTypePage/profSignUpPage.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({this.toggleView});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final tabs = [
    //----------------
    Center(
      child: EtudiantSignUp(),
    ),
    //-----------------
    Center(
      child: ProfSignUp(),
    ),
    //---------------
    Center(
      child: CompatbleSignUp(),
    ),
    Center(
      child: DepartmentSignUp(),
    ),
  ];
  //--------------
  int _currentIndex = 0;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 27,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ),
            body: tabs[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.indigo[500],
              elevation: 0.0,
              iconSize: 30.0,
              unselectedFontSize: 10.0,
              selectedFontSize: 17,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  backgroundColor: Colors.indigo,
                  title: Text(
                    'Etudiant',
                    style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  backgroundColor: Colors.indigo[400],
                  title: Text(
                    'Professeur',
                    style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  backgroundColor: Colors.indigo[300],
                  title: Text(
                    'Comptable',
                    style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  backgroundColor: Colors.purple[400],
                  title: Text(
                    'Departement',
                    style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            backgroundColor: Colors.indigo,
          );
  }
}
