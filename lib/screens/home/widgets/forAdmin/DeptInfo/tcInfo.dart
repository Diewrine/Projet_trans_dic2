import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class TCpage extends StatefulWidget {
  @override
  _TCpageState createState() => _TCpageState();
}

class _TCpageState extends State<TCpage> {
  final _formKey = GlobalKey<FormState>();

  DatabaseService databaseService = new DatabaseService();

  QuerySnapshot deptInfo;

  @override
  void initState() {
    databaseService.getDeptInfo("T.C").then((results) {
      setState(() {
        deptInfo = results;
      });
    });
    super.initState();
  }

  String chefDept;
  String responsable1;
  String responsable2;
  String responsable3;

  @override
  Widget build(BuildContext context) {
    if (deptInfo != null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Tronc Commun",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  wordSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),

                    //Formulaire
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  ),
                                  // TextFormField

                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "Ce champ est obligatoire"
                                        : null,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Chef de département",
                                      hintText: deptInfo
                                              .documents[0].data["deptChief"] ??
                                          "non renseigné",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    initialValue:
                                        deptInfo.documents[0].data["deptChief"],
                                    onChanged: (value) {
                                      setState(() {
                                        chefDept = value;
                                      });
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  ),
                                  // TextFormField

                                  child: TextFormField(
                                    //decoration
                                    validator: (value) => value.isEmpty
                                        ? "Ce champ est obligatoire"
                                        : null,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Responsable T.C.1",
                                      hintText: deptInfo.documents[0]
                                              .data["responsable1"] ??
                                          "non renseigné",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    initialValue: deptInfo
                                        .documents[0].data["responsable1"],
                                    onChanged: (value) {
                                      setState(() {
                                        responsable1 = value;
                                      });
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  ),
                                  // TextFormField

                                  child: TextFormField(
                                    //decoration
                                    validator: (value) => value.isEmpty
                                        ? "Ce champ est obligatoire"
                                        : null,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Responsable T.C.2",
                                      hintText: deptInfo.documents[0]
                                              .data["responsable2"] ??
                                          "non renseigné",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    initialValue: deptInfo
                                        .documents[0].data["responsable2"],
                                    onChanged: (value) {
                                      setState(() {
                                        responsable2 = value;
                                      });
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: 15.0,
                                ),

                                // end of fields
                                SizedBox(
                                  height: 20.0,
                                ),

                                Center(
                                  child: RaisedButton(
                                      color: Colors.indigo,
                                      elevation: 0.0,
                                      child: Text(
                                        "Soumettre",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          await databaseService
                                              .updateDeptInfoData(
                                                  "T.C",
                                                  chefDept,
                                                  responsable1,
                                                  responsable2,
                                                  " ");
                                          _showMyDialog();
                                        }
                                      }),
                                ),
                                //Raise Button se Connecter
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      );
    } else {
      return Loading2();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Départements"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Modifications réussies",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Les informations de ce département ont été modifiées.",
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
