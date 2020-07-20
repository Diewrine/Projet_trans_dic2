import 'package:dic2_project_trans/screens/home/widgets/EditProfil/editProfil.dart';
import 'package:dic2_project_trans/screens/pMoney/comptaMoney.dart';
import 'package:dic2_project_trans/screens/pMoney/transfertHistoric.dart';
import 'package:flutter/material.dart';

//import '../../editProfil.dart';

class ComptaDisplayedPage extends StatefulWidget {
  final String uid;
  final String name;
  ComptaDisplayedPage({this.uid, this.name});
  @override
  _ComptaDisplayedPageState createState() => _ComptaDisplayedPageState();
}

class _ComptaDisplayedPageState extends State<ComptaDisplayedPage> {
  @override
  Widget build(BuildContext context) {
    //final String userUid = widget.uid;
    final String name = widget.name;

    void _showModalPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: EditProfil(),
            );
          });
    }

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  color: Colors.white,
                  onPressed: _showModalPanel,
                ),
                Text(
                  "Modifier\nle profil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.security,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return TransfertHistoricCompta();
                          },
                          fullscreenDialog: true,
                        ));
                  },
                ),
                Text(
                  'Historique des\ntransactions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[500],
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.attach_money,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ComptaMoney(name: name);
                          },
                          fullscreenDialog: true,
                        ));
                  },
                ),
                Text(
                  "Transfert\npMoney",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
