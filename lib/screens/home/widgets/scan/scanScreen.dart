
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
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
              child: RaisedButton(
                child:Text("Payer inscription") ,
                onPressed: () { 
                  PayerInscription();
                 },
                
              )//Text('scan result,$qrText'),
            ),
          )
        ],
      ),
    );
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
  //its quite simple as that you can use try and catch staatements too for platform exception
}
