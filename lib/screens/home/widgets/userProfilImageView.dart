import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfilView extends StatefulWidget {
  @override
  _UserProfilViewState createState() => _UserProfilViewState();
}

class _UserProfilViewState extends State<UserProfilView> {
  //--------------------------
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(60.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      spreadRadius: 2,
                    )
                  ]),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: (userData.urlPhoto == null)
                      ? AssetImage("assets/iconProfil.png")
                      : NetworkImage(userData.urlPhoto),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
