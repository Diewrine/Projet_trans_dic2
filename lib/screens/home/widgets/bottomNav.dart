import 'package:dic2_project_trans/screens/home/HomeBottomNav/listUsers.dart';
import 'package:dic2_project_trans/screens/home/HomeBottomNav/messageAdminPage.dart';
//import 'package:dic2_project_trans/screens/home/home.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  BottomNav({this.currentIndex});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.indigo[500],
      iconSize: 30.0,
      unselectedFontSize: 11.0,
      selectedFontSize: 11,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (BuildContext context) {
              //         return Home();
              //       },
              //       fullscreenDialog: false,
              //     ));
            },
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(
                Icons.group,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ListUserPage();
                      },
                      fullscreenDialog: false,
                    ));

                //----------------------
              }),
          title: Text(
            'Comptess',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Info();
                      },
                      fullscreenDialog: false,
                    ));
              }),
          title: Text(
            'Informations',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
