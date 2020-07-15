import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Instance of user
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Collection reference for User
  final CollectionReference userCollection =
      Firestore.instance.collection('UserData');

  Future updateUserData(String fullname, String jobFunction, String dept,
      String classe, double pMoney, String urlPhoto, acountActivated) async {
    return await userCollection.document(uid).setData({
      "uid": uid,
      'fullname': fullname,
      'jobFunction': jobFunction,
      'dept': dept,
      'classe': classe,
      'pMoney': pMoney,
      "urlPhoto": null,
      'acountActivated': acountActivated,
    });
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
      urlPhoto: snapshot.data['urlPhoto'],
      pMoney: snapshot.data['pMoney'],
    );
  }

  //---------For urlProfil of user
  Future updatePhoto(String url) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    try {
      await userCollection.document(uid).updateData({
        'urlPhoto': url,
      });
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// get Etudiant List
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

  Future etuTreansfertPMoney(String uidUser, double pMoney) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    //print(uid);
    try {
      await userCollection.document(uidUser).updateData({
        'pMoney': FieldValue.increment(pMoney),
      });
      await userCollection.document(uid).updateData({
        'pMoney': FieldValue.increment(-pMoney),
      });
      return userData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //-------------------For BottomNavBar
  listUserForBottomNav() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String jobFunction = document.data["jobFunction"];

    try {
      if (jobFunction == "Etudiant") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where(
              "jobFunction",
              isEqualTo: "Etudiant",
            )
            .getDocuments();
      } else if (jobFunction == "Comptable") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where(
              "jobFunction",
              isEqualTo: "Comptable",
            )
            .getDocuments();
      } else if (jobFunction == "Professeur") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where(
              "jobFunction",
              isEqualTo: "Professeur",
            )
            .getDocuments();
      } else if (jobFunction == "departmentChief") {
        print("Departement ...");
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where(
              "jobFunction",
              isEqualTo: "departmentChief",
            )
            .getDocuments();
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //-----------------For Scan transaction
  Future scanPaymentAction(String scanResult) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    //print(uid);
    try {
      if (scanResult == "Launch100") {
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-100),
        });
      } else if (scanResult == "breakFast50") {
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-50),
        });
      } else if (scanResult == "rent3000") {
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-3000),
        });
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
