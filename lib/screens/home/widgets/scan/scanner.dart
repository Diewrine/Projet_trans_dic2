import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  DatabaseService databaseService = new DatabaseService();
  GlobalKey qrKey = GlobalKey();
  String qrText;
  bool colorSet = false;
  bool colorTextScan = false;
  String textScan = "";
  QRViewController controller;
  String text1 = 'Opération réussie.';
  String text2 = 'Votre compte a été mis à jour. Merci !';
  String text3 = 'Votre profil a été mis à jour. Merci !';

  DateTime _currentDate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    //----For textScan
    if (qrText == "Launch100") {
      setState(() {
        colorTextScan = true;
        textScan = "Repas\nVous allez être débitée de 100 pM !";
      });
    } else if (qrText == "breakFast50") {
      setState(() {
        colorTextScan = true;
        textScan = "Petit déjeuner\nVous allez être débitée de 50 pM !";
      });
    } else if (qrText == "rent3000") {
      setState(() {
        colorTextScan = true;
        textScan = "Logement\nVous allez être débitée de 3000 pM !";
      });
    } else if (qrText == null) {
      setState(() {
        colorTextScan = false;
        textScan = "";
      });
    }
    //---------------
    else if (qrText == "eNtrycLaSsDIC2" ||
        qrText == "eNtRycLasSDIC3gEm" ||
        qrText == "eNtRycLasSDIC1gC") {
      setState(() {
        colorTextScan = true;
        textScan =
            "Enregistrez votre heure d'entrée.\nSinon, vous serez considérez absent (e)";
      });
    } else if (qrText == "EXiTcLasSDIC2" ||
        qrText == "EXiTcLasSDIC3gEm" ||
        qrText == "EXiTcLasSDIC1gC") {
      setState(() {
        colorTextScan = true;
        textScan = "Enregistrez votre heure de sortie.\n";
      });
    }
    //-------------------
    else {
      setState(() {
        colorTextScan = false;
        textScan = "Ce QRcode n'est pas pris en charge";
      });
    }

    //---------------------
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        // elevation: 0.0,

        title: Text("Scan !"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 27,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              overlay: QrScannerOverlayShape(
                borderRadius: 10,
                borderColor: Colors.green[200],
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
              key: qrKey,
              onQRViewCreated: _onQRViewCreate,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: RaisedButton(
                // disabledColor: Colors.indigo,

                child: Text((() {
                  if (qrText != null) {
                    setState(() {
                      colorSet = true;
                    });
                    return "cliquer pour valider";
                  } else {
                    return " Scannez le QRcode";
                  }
                })(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),

                color: colorSet ? Colors.greenAccent[400] : Colors.indigo[400],
                onPressed: () async {
                  if (qrText == null) {
                    setState(() {
                      colorTextScan = true;
                      textScan = "Scan non achevé !";
                    });
                  } else if (qrText == "eNtrycLaSsDIC2" ||
                      qrText == "EXiTcLasSDIC2" ||
                      qrText == "EXiTcLasSDIC3gEm" ||
                      qrText == "eNtRycLasSDIC3gEm" ||
                      qrText == "eNtRycLasSDIC1gC" ||
                      qrText == "EXiTcLasSDIC1gC") {
                    dynamic result = await databaseService.scanPresenceClass(
                        qrText, _currentDate);
                    if (result != null) {
                      _showMyDialog(text1, text3);
                    } else {
                      setState(() {
                        colorTextScan = true;
                        textScan =
                            "Vous n'êtes pas à la bonne classe !\nVeuillez ressayer";
                      });
                      _showMyDialog(
                          "Echec", "Vous n'êtes pas à la bonne classe.");
                    }
                  } else {
                    dynamic result =
                        await databaseService.scanPaymentAction(qrText);
                    if (result != null) {
                      _showMyDialog(text1, text2);
                    } else {
                      _showMyDialog("Echec de l'opération",
                          "Votre solde est insuffisant.\nVeuillez recharger votre compte.");
                    }
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Center(
                  child: Text(
                    textScan,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorTextScan ? Colors.indigo[400] : Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
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

  Future<void> _showMyDialog(String text1, String text2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  text1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  text2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
