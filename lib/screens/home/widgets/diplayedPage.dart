import 'package:flutter/material.dart';

import 'EditProfil/editProfil.dart';

class DisplayedPage extends StatefulWidget {
  @override
  _DisplayedPageState createState() => _DisplayedPageState();
}

class _DisplayedPageState extends State<DisplayedPage> {
  @override
  Widget build(BuildContext context) {
    void _showModalPanel() {
      showModalBottomSheet(context: context, builder:(context){
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
            //height: 70,
            //width: 80,
            //decoration: BoxDecoration(
                //color: Colors.indigo[500],
                //borderRadius: BorderRadius.circular(30),
               // boxShadow: [
                  //BoxShadow(
                    //color: Colors.indigo[500],
                    //spreadRadius: 1,
                  //)
                //]),
          
              child:Column(
                children: <Widget>[
                  FlatButton.icon(
                    label: Text(
                      "Modifier\nle profil",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.rtl,
            
                      style: TextStyle(

                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: _showModalPanel,
                  )
                ],
              ),
           
          ),
          Container(
            height: 70,
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
            child: Padding(
              padding: const EdgeInsets.all(4.5),
              child: Column(
                children: <Widget>[
                  Icon(
                    //Icons.crop_free,
                    //Icons.flip,
                    //Icons.fullscreen,
                    //Icons.sensor_window,
                    Icons.payment,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Faire un\nscan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70,
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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Polytech\nMoney",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   height: 70,
          //   width: 80,
          //   decoration: BoxDecoration(
          //       color: Colors.indigo[500],
          //       borderRadius: BorderRadius.circular(30),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.indigo[500],
          //           spreadRadius: 1,
          //         )
          //       ]),
          //   child: Padding(
          //     padding: const EdgeInsets.all(4),
          //     child: Column(
          //       children: <Widget>[
          //         Icon(
          //           Icons.edit,
          //           color: Colors.white,
          //         ),
          //         SizedBox(
          //           height: 3,
          //         ),
          //         Text(
          //           'Editer\n profil',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 10.0,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
