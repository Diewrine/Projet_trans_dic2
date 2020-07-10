import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/widgets/diplayedPage.dart';
import 'package:dic2_project_trans/screens/home/widgets/menuItem.dart';
import 'package:dic2_project_trans/screens/home/widgets/userProfilImageView.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  
 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return StreamBuilder<EtudiantData>(
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height / 2),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 10,
                        )
                      ],
                      color: Colors.indigo[500],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[
                              Padding(
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 100.0, vertical: 10.0),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: UserProfilView(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            //'Etudiant',
                            userData.jobFunction,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              // 'Cheikh Mbacké WADE'
                              userData.fullname,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            // padding: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: DisplayedPage(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Menu item
                  Container(
                    // padding: EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                    //margin: EdgeInsets.only(top: 100),
                    child: MenuItem(),
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
