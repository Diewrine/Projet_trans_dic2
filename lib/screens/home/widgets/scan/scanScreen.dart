import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/home/paiement/payerInscription.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey qrKey = GlobalKey();
  String qrText = "";
  String message = "";
  final double montantPetitDej = 50;
  final double montantDejeunerDiner = 100;
  String ackOfValidatingPayment;
  final double montantTc = 25000;
  final double montantDic = 50000;
  double pMoney;
  double restantSolde;
  QRViewController controller;
  String inscription;

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title: Text("Scanner "),
                centerTitle: true,
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.red,
                        borderLength: 30,
                        borderRadius: 10,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                      onQRViewCreated: _onQRViewCreate,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: RaisedButton(child: Text(
                        (() {
                          if (qrText=="ptitdej") {
                            return "val";
                          } else {
                            return "Le Scan n'a pas commencé ";
                          }
                        })(),
                      ), onPressed: () async {
                        if (qrText == "optioninscription") {
                          if (userData.classe == "D.I.C.1" ||
                              userData.classe == "D.I.C.2" ||
                              userData.classe == "D.I.C.3" &&
                                  userData.pMoney >= montantDic) {
                            setState(() {
                              pMoney = userData.pMoney;
                              restantSolde = pMoney - montantDic;
                            });
                            await DatabaseService(uid: userData.uid)
                                .updateUserData(
                                    userData.fullname,
                                    userData.jobFunction,
                                    userData.dept,
                                    userData.classe,
                                    restantSolde,
                                    userData.accountActivated);
                          } else if (userData.classe == "T.C.1" ||
                              userData.classe == "T.C.2" &&
                                  userData.pMoney >= montantTc) {
                            setState(() {
                              pMoney = userData.pMoney;
                              restantSolde = pMoney - montantTc;
                            });

                            await DatabaseService(uid: userData.uid)
                                .updateUserData(
                                    userData.fullname,
                                    userData.jobFunction,
                                    userData.dept,
                                    userData.classe,
                                    restantSolde,
                                    userData.accountActivated);
                          } else {
                            setState(() {
                              message =
                                  "Votre solde est insuffisant pour l'inscription";
                            });
                          }
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PayerInscription(qrText, message)));
                        }
                         else if (qrText =="dinerdej" && userData.pMoney>=montantDejeunerDiner
                            ) {
                          setState(() {
                            pMoney = userData.pMoney;
                            restantSolde = pMoney - montantPetitDej;
                          });

                          await DatabaseService(uid: userData.uid)
                              .updateUserData(
                                  userData.fullname,
                                  userData.jobFunction,
                                  userData.dept,
                                  userData.classe,
                                  restantSolde,
                                  userData.accountActivated);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PayerInscription(qrText, message)));
                        } else if (qrText=="ptitdej" && userData.pMoney>=montantPetitDej
                          ) {
                          setState(() {
                            pMoney = userData.pMoney;
                            restantSolde = pMoney - montantDejeunerDiner;
                          });

                          await DatabaseService(uid: userData.uid)
                              .updateUserData(
                                  userData.fullname,
                                  userData.jobFunction,
                                  userData.dept,
                                  userData.classe,
                                  restantSolde,
                                  userData.accountActivated);

                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PayerInscription(qrText, message)));
                        } else {
                          setState(() {
                            message =
                                "Vous ne pouvez pas acheter un ticket de dejeuner ni diner";
                          });
                        }
                      }),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}
