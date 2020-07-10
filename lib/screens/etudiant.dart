import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authPage/loginPage.dart';
import 'home/home.dart';

class Etudiant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    var snapshot = Provider.of<QuerySnapshot>(context);

    print(snapshot.documents);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(child: 
          Text(user.uid)),
        ],
      ));
        
  }
}
