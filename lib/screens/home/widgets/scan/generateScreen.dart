import 'package:dic2_project_trans/screens/home/widgets/scan/scanScreen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateScreen extends StatefulWidget {
  @override
  _GenerateScreenState createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  String qrData="Bonjour mon ami";
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Qrcode generator"),
        actions: <Widget>[],
      ),
      body:Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QrImage(
                data:qrData,
              ),
              Text(
                "New qr generator",
        
              ),
              TextField(
                controller: qrdataFeed,
                decoration: InputDecoration(
                  hintText: "input link",
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {
                    if(qrdataFeed.text.isEmpty){
                  
                      setState(() {
                        qrData="";
                      });
                    }
                    else

                    {
                       setState(() {
                       qrData=qrdataFeed.text;
                      });
                      print(qrdataFeed.text);
                    
                    }
                       

                  }, child: Text("Generate qrcode",
                  style: TextStyle(
                    color: Colors.blue,fontWeight: FontWeight.bold
                  ),
    
              
                  ),
                ),
              )

            ],
          )
        )
      );
      
    
  }
   final qrdataFeed=TextEditingController();
  
}