import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UserProfilView extends StatefulWidget {
 
 
  
  @override
  _UserProfilViewState createState() => _UserProfilViewState();
}

class _UserProfilViewState extends State<UserProfilView> {
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
  }
}
