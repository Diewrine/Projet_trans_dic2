import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference for User
  final CollectionReference userCollection =
      Firestore.instance.collection('UserData');

  Future updateUserData(String fullname, String jobFunction, String dept,
      String classe, double pMoney, acountActivated) async {
    return await userCollection.document(uid).setData({
      "uid": uid,
      'fullname': fullname,
      'jobFunction': jobFunction,
      'dept': dept,
      'classe': classe,
      'pMoney': pMoney,
      'acountActivated': acountActivated,
    });
  }

// Transfer Service
  Future treansfertPMoney(String uidUser, double pMoney) async {
    try {
      await userCollection.document(uidUser).updateData({
        'pMoney': FieldValue.increment(pMoney),
      });
      return userData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User data from snapshot
  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      accountActivated: snapshot.data['name'],
      classe: snapshot.data['classe'],
      dept: snapshot.data['dept'],
      fullname: snapshot.data['fullname'],
      jobFunction: snapshot.data['jobFunction'],
      pMoney: snapshot.data['pMoney'],
    );
  }

  getEtuList() async {
    return await Firestore.instance
        .collection('UserData')
        .orderBy("fullname")
        .where("jobFunction", isEqualTo: "Etudiant")
        .getDocuments();
  }

  // get users doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userData);
  }
//--------------------------------------For Transfert Historic

  // Collection reference for User
  final CollectionReference treansfertLogsCollection =
      Firestore.instance.collection('TransfertLogsData');

  Future updateTransfertLog(
      String sendBy, String receiver, double montant) async {
    return await treansfertLogsCollection.document().setData({
      "uid": uid,
      'sendBy': sendBy,
      'receiver': receiver,
      'montant': montant,
      //dateTime
    });
  }

  // Get Logs
  getLogs() async {
    return await Firestore.instance
        .collection('TransfertLogsData')
        .getDocuments();
  }
}
