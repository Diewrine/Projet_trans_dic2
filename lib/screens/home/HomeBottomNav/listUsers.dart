import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/screens/home/widgets/bottomNav.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  QuerySnapshot usersList;
  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    databaseService.listUserForBottomNav().then((results) {
      setState(() {
        usersList = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comptes existants"),
        backgroundColor: Colors.indigo,
        leading: Icon(
          Icons.arrow_back,
          size: 27,
          color: Colors.white,
        ),
      ),
      body: _usersList(),
      bottomNavigationBar: BottomNav(currentIndex: 1),
    );
  }

  Widget _usersList() {
    if (usersList != null) {
      return ListView.builder(
        itemCount: usersList.documents.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(usersList.documents[i].data["fullname"]),
            subtitle: Text("Subtitle"),
            leading: Image.asset("assets/avatar.jpg"),
          );
        },
      );
    } else {
      return Loading2();
    }
  }
}
