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
    } else {
      setState(() {
        colorTextScan = false;
        textScan = "Ce QRcode n'est pas pris en charge";
      });
    }

    //---------------------
    return Scaffold(
      backgroundColor: Colors.indigo[100],
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
                onPressed: () {
                  if (qrText == null) {
                    setState(() {
                      colorTextScan = true;
                      textScan = "Scan incomplet !";
                    });
                  } else {
                    dynamic result = databaseService.scanPaymentAction(qrText);
                    if (result != null) {
                      _showMyDialog();
                    } else {
                      setState(() {
                        colorTextScan = true;
                        textScan =
                            "L'opération n'a pas abouti !\nVeuillez ressayer";
                      });
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

  Future<void> _showMyDialog() async {
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
                  'Opération réussie.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text('Votre compte a été mis à jour. Merci !'),
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
