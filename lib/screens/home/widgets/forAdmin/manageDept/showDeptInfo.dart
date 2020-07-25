import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:dic2_project_trans/shared/loading.dart';
import 'package:flutter/material.dart';

class ShowDeptInfo extends StatefulWidget {
  final UserData userData;
  ShowDeptInfo({this.userData});
  @override
  _ShowDeptInfoState createState() => _ShowDeptInfoState();
}

class _ShowDeptInfoState extends State<ShowDeptInfo> {
  DatabaseService databaseService = new DatabaseService();

  QuerySnapshot deptInfo;
  bool loading = false;

  @override
  void initState() {
    if (widget.userData.dept == "G.I.T.") {
      databaseService.getDeptInfo("G.I.T").then((results) {
        setState(() {
          deptInfo = results;
          loading = true;
        });
      });
      super.initState();
    } else if (widget.userData.dept == "G.E.M.") {
      databaseService.getDeptInfo("G.E.M").then((results) {
        setState(() {
          deptInfo = results;
          loading = true;
        });
      });
      super.initState();
    } else if (widget.userData.dept == "G.C.") {
      databaseService.getDeptInfo("G.C").then((results) {
        setState(() {
          deptInfo = results;
          loading = true;
        });
      });
      super.initState();
    } else if (widget.userData.dept == "T.C.") {
      databaseService.getDeptInfo("T.C").then((results) {
        setState(() {
          deptInfo = results;
          loading = true;
        });
      });
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserData user = widget.userData;

    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Infos du département"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: (loading)
              ? Center(
                  child: _textDeptInfo(user, deptInfo),
                )
              : Loading2(),
        ),
      ),
    );
  }

  //---------------------

  Widget _deptInfo(UserData user, QuerySnapshot deptInfo) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.blue[50],
            elevation: 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Chef de département",
                      ),
                      Text(
                        deptInfo.documents[0].data["deptChief"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Responsable D.I.C.1"),
                      Text(
                        deptInfo.documents[0].data["responsable1"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Responsable D.I.C.2"),
                      Text(
                        deptInfo.documents[0].data["responsable2"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Responsable D.I.C.3"),
                      Text(
                        deptInfo.documents[0].data["responsable3"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: _aboutDept(user),
          ),
        ],
      ),
    );
  }

  Widget _aboutDept(UserData user) {
    if (user.dept == "G.I.T.") {
      return Text(
        "Le département Génie Informatique et Télécommunications a pour objectif de former des ingénieurs de Conception généralistes en Informatique et Télé- communications ayant des compétences dans la\n Modélisation, la Réalisation et le Déploiement de bout en bout en Systèmes et Réseaux, Systèmes d’Information, Bases de Données, Génie Logiciel, Sécurité et Qualité.Secteurs d’intervention\nSociétés et Organisations évoluant dans les Technologies de l’Information et de la Communication (TIC).\nSystèmes et Réseaux\nArchitecture des Systèmes d’Information\nSécurité Informatique et Télécommunications\nProjets TIC\nBase de Données\nGénie Logiciel\nQualité",
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      );
    } else if (user.dept == "G.E.M.") {
      return Text(
        "Le département Génie Électromécanique a pour objectif de former des ingénieurs généralistes présentant un bon équilibre entre les connaissances scientifiques, technologiques et systèmes.\nLa formation dans cette spécialité permet de prendre en compte, dans une démarche d’ingénierie simultanée, toutes les données relatives à la vie d’un produit ou d’un système, depuis l’avant-projet jusqu’à sa réalisation et son recyclage éventuel.\nElle vise à doter l’ingénieur de compétences larges, basées sur la complémentarité des connaissances pluridisciplinaires scientifiques et techniques qui relèvent du Génie Mécanique et du Génie Electrique.\nSecteurs d’intervention\nProduction mécanique ;\nMaintenance industrielle ;\nBureaux d’études ;\nProduction d’énergie ;\nTechnico-commercial ;\nRecherche et développement.",
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      );
    } else if (user.dept == "G.C.") {
      return Text(
        "Le département Génie Civil a pour objectif de former des ingénieurs généralistes présentant un bon équilibre entre les connaissances scientifiques et techno- logiques orientées vers les sciences de la construction.\nLa formation vise à doter l’ingénieur de compétences larges, basées sur la complémentarité des connaissances pluridisciplinaires scientifiques et techniques qui relèvent du Génie Civil.\nSecteurs d’intervention\nBâtiment (structures, équipements techniques…)\nTravaux publics (AEP, ponts, routes, terrassements…)\nAménagement urbain (voirie, assainissement, réseaux divers…)",
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      );
    } else {
      return Text("Non renseigné");
    }
  }

  Widget _textDeptInfo(UserData user, QuerySnapshot deptInfo) {
    if (user.dept == "G.I.T.") {
      return _deptInfo(user, deptInfo);
    } else if (user.dept == "G.E.M.") {
      return _deptInfo(user, deptInfo);
    } else if (user.dept == "G.C.") {
      return _deptInfo(user, deptInfo);
    } else if (user.dept == "T.C.") {
      return Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.blue[50],
              elevation: 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Chef de département",
                        ),
                        Text(
                          deptInfo.documents[0].data["deptChief"],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Responsable T.C.1"),
                        Text(
                          deptInfo.documents[0].data["responsable1"],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Responsable T.C.2"),
                        Text(
                          deptInfo.documents[0].data["responsable2"],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Text(
                "Pour le tronc commun ....",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(150.0),
        child: Card(
          child: Text("Votre departement n'est pas reconnu"),
        ),
      );
    }
  }
}
