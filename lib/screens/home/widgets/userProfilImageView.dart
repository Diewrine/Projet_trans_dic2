<<<<<<< HEAD
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

=======
import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
>>>>>>> 67440c4855c22ff95eea4619e62d960c799ed7cb

class UserProfilView extends StatefulWidget {
 
 
  
  @override
  _UserProfilViewState createState() => _UserProfilViewState();
}

class _UserProfilViewState extends State<UserProfilView> {
<<<<<<< HEAD
   final picker = ImagePicker();
   File newProfilImage;
  Future getImageProfilNupload() async {
   
    final tempImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      newProfilImage = File(tempImage.path);

    });
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('my image 4');
    final StorageUploadTask task = firebaseStorageRef.putFile(newProfilImage);

  }
  
  _UserProfilViewState();

  

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.blue[100],
      //     borderRadius: BorderRadius.circular(60.5),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.yellow,
      //         spreadRadius: 2,
      //       )
      //     ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: newProfilImage== null ? AssetImage("assets/avatar.jpg") :FileImage(newProfilImage),
                
                  child: ClipOval(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                    
                    ),
                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    
                  ),
                  
                  onPressed: getImageProfilNupload,
                ),

              )

            ],
             
          ),
         
          
        ],
      ),
    );
=======
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
>>>>>>> 67440c4855c22ff95eea4619e62d960c799ed7cb
  }
}
