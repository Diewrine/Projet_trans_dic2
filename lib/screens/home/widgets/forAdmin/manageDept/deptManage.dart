import 'package:dic2_project_trans/screens/home/widgets/forAdmin/DeptInfo/gcInfo.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/DeptInfo/gemInfo.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/DeptInfo/gitInfo.dart';
import 'package:dic2_project_trans/screens/home/widgets/forAdmin/DeptInfo/tcInfo.dart';
import 'package:flutter/material.dart';

class ManageDept extends StatefulWidget {
  @override
  _ManageDeptState createState() => _ManageDeptState();
}

class _ManageDeptState extends State<ManageDept> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: GITpage(),
    ),
    Center(
      child: GEMpage(),
    ),
    Center(
      child: GCpage(),
    ),
    Center(
      child: TCpage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Départements"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 27,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(child: tabs[_currentIndex]),

      //----------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.maximize),
              title: Text('G.I.T'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.maximize),
              title: Text('G.E.M.'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.maximize),
              title: Text('G.C.'),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.maximize),
              title: Text('T.C.'),
              backgroundColor: Colors.purple),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
