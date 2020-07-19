
import 'package:flutter/material.dart';


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
        title: Text("bienvenu"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          
        ],
      ),
    );
  }

  
}
