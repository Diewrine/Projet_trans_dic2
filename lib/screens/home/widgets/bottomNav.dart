import 'package:dic2_project_trans/screens/home/HomeBottomNav/listUsers.dart';
import 'package:dic2_project_trans/screens/home/home.dart';
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
      unselectedFontSize: 9.0,
      selectedFontSize: 15,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Home();
                    },
                    fullscreenDialog: true,
                  ));
            },
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          // icon: Icon(
          //   Icons.group,
          //   color: Colors.white,
          // ),
          icon: IconButton(
              icon: Icon(
                Icons.group,
                color: Colors.white,
              ),
              onPressed: () {
                //------------------
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ListUserPage();
                      },
                      fullscreenDialog: true,
                    ));

                //----------------------
              }),
          title: Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera,
            color: Colors.white,
          ),
          title: Text(
            'Item 3',
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
