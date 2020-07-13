import 'package:dic2_project_trans/models/user.dart';
import 'package:flutter/material.dart';

class PayerInscription extends StatefulWidget {
  final UserData userData;
  PayerInscription(this.userData);
  @override
  _PayerInscriptionState createState() => _PayerInscriptionState(this.userData);
}

class _PayerInscriptionState extends State<PayerInscription> {
  final UserData userData;
  _PayerInscriptionState(this.userData);

  double montantTc;
  double montantDic;
  int pMoney;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation"),
        centerTitle: true,

      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Valider"),
            onPressed: () async {
              if(userData.classe=="D.I.C.3"&& userData.classe=="D.I.C.2"){
                setState(() {
                  pMoney=userData.pMoney;
                  
                });
              }

            },
          )
        ],
      ),

      
      
    );
  }
}