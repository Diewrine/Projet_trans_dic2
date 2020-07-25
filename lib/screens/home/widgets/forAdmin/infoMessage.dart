import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:flutter/material.dart';

class MessageAdmin extends StatefulWidget {
  @override
  _MessageAdminState createState() => _MessageAdminState();
}

class _MessageAdminState extends State<MessageAdmin> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot messageInfo;
  String objetMess;
  String messageText;
  String errorText = "";

  @override
  void initState() {
    databaseService.getAdminMessage().then((results) {
      setState(() {
        messageInfo = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Message admin"),
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
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Column(
            children: <Widget>[
              Card(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          objetMess = value;
                        });
                      },
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      decoration: InputDecoration.collapsed(hintText: "Objet:"),
                    ),
                  )),
              Card(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      style: TextStyle(fontSize: 18),
                      maxLines: 10,
                      decoration: InputDecoration.collapsed(
                          hintText: "Entrer votre message..."),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  if (messageText == null || objetMess == null) {
                    setState(() {
                      errorText = "* Remplissez tous les champs!";
                    });
                  } else {
                    dynamic result =
                        databaseService.updateMessage(objetMess, messageText);
                    if (result != null) {
                      Navigator.pop(context);
                      setState(() {
                        errorText = "";
                        objetMess = "";
                        messageText = "";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageAdmin()),
                        );
                      });
                    }
                  }
                },
                child: Text(
                  "      Poster     ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.blue,
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                errorText,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              )),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Center(
                  child: _messageInfo(),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _messageInfo() {
    if (messageInfo != null) {
      return Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: new ListTile(
          dense: true,
          title: Text(
            messageInfo.documents[0].data["message"],
            style: TextStyle(
              fontSize: 17,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
          subtitle: Text(
            messageInfo.documents[0].data["object"],
            style: TextStyle(
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    } else {
      return Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: new ListTile(
          dense: true,
          title: Text(
            "Pas de message envoyé pour l'instant",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      );
    }
  }
}
