import 'dart:io';

import 'package:flutter/material.dart';

import '../../editProfil.dart';

class DeptDisplayedPage extends StatefulWidget {
  final File newProfilImage;
  final Function getImageProfilNupload;
  DeptDisplayedPage(this.newProfilImage,this.getImageProfilNupload);
  @override
  _DeptDisplayedPageState createState() => _DeptDisplayedPageState(this.newProfilImage,this.getImageProfilNupload);
}

class _DeptDisplayedPageState extends State<DeptDisplayedPage> {
  final File newProfilImage;
  Function getImageProfilNupload;
  _DeptDisplayedPageState(this.newProfilImage,this.getImageProfilNupload);

  @override
  Widget build(BuildContext context) {
    void _showModalPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: EditProfil(),
            );
          });
    }
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  color: Colors.white,
                  onPressed: _showModalPanel,
                ),
                Text(
                  "Modifier\nle profil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  //Icons.crop_free,
                  //Icons.flip,
                  //Icons.fullscreen,
                  //Icons.sensor_window,
                  icon: Icon(
                    Icons.person_add,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text(
                  'Ajouter un\nProf',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
           Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.all_inclusive,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text(
                  "Changer\nPhoto",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.all_inclusive,
                  ),
                  color: Colors.white,
                  onPressed: getImageProfilNupload,
                ),
                Text(
                  "Menu\nDept",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
