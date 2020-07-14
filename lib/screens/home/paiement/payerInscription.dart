import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class PayerInscription extends StatefulWidget {

  final String qrText;
  final String message;
  PayerInscription( this.qrText,this.message);
  @override
  _PayerInscriptionState createState() =>
      _PayerInscriptionState( this.qrText,this.message);
}

class _PayerInscriptionState extends State<PayerInscription> {
  final String qrText;
  final String message;
  _PayerInscriptionState( this.qrText,this.message);

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merci pour votre transaction"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          
        ],
      ),
    );
  }

  
}
