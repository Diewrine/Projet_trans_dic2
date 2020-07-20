import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  final UserData userData;
  ProfilePage({this.userData});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseService databaseService = new DatabaseService();

  //String fullname = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  void returnUid() async {
    final FirebaseUser user = await auth.currentUser();
    setState(() {
      uid = user.uid;
    });
  }

  @override
  void initState() {
    returnUid();

    super.initState();
  }

  String uid;
  String url;

  File _image;

  @override
  Widget build(BuildContext context) {
    final UserData user = widget.userData;
    // setState(() {
    //   fullname = user.fullname;
    // });

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    }

    Future uploadPic(BuildContext context) async {
      try {
        StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(uid);
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

        dynamic dowurl = await taskSnapshot.ref.getDownloadURL();

        setState(() {
          url = dowurl;
          //print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Profile Picture Uploaded')));
        });
        return true;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Modifier l'avatar"),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/iconProfil.png",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        tooltip: "Upload",
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 25.0,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Card(
                //       elevation: 0.0,
                //       color: Colors.transparent,
                //       margin: EdgeInsets.symmetric(horizontal: 20),
                //       borderOnForeground: true,
                //       child: Container(
                //         child: Form(
                //           key: _formKey,
                //           child: Column(
                //             children: <Widget>[
                //               Column(
                //                 children: <Widget>[
                //                   Container(
                //                     padding: EdgeInsets.symmetric(
                //                         horizontal: 15, vertical: 3),
                //                     decoration: BoxDecoration(
                //                       border: Border(
                //                         bottom: BorderSide(
                //                           color: Colors.grey[100],
                //                         ),
                //                       ),
                //                     ),
                //                     child: Center(
                //                       child: TextFormField(
                //                         validator: (value) => value.isEmpty
                //                             ? "Ce champ est obligatoire"
                //                             : null,
                //                         style: TextStyle(
                //                           fontWeight: FontWeight.w700,
                //                         ),
                //                         decoration: InputDecoration(
                //                           hintText: user.fullname,
                //                           labelText: "fullname",
                //                           border: OutlineInputBorder(),
                //                         ),
                //                         initialValue: user.fullname,
                //                         onChanged: (value) {
                //                           setState(() {
                //                             fullname = value;
                //                           });
                //                         },
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 50,
                //                   ),
                //                   Container(
                //                     child: Text("data"),
                //                   ),
                //                   //*********** */
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       )),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('fullname',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(user.fullname,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('département',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(user.dept,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('classe',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(user.classe,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('status',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(user.jobFunction,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        color: Color(0xff476cfb),
                        onPressed: () async {
                          // print(
                          //     "***********\n***********\n***********\n***********\n");
                          // print(fullname);
                          // databaseService.updateUserData(
                          //     fullname,
                          //     user.jobFunction,
                          //     user.dept,
                          //     user.classe,
                          //     user.pMoney,
                          //     user.urlPhoto,
                          //     user.accountActivated);

                          dynamic resultRequest = await uploadPic(context);
                          if (resultRequest != null) {
                            dynamic result = databaseService.updatePhoto(url);
                            if (result != null) {
                              print("ok");
                            } else {
                              print("echec");
                            }
                          }
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Appliquer cet avatar',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
