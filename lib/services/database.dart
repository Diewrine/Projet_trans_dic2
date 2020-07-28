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

  Future updateUserData(
      String fullname,
      String jobFunction,
      String dept,
      String classe,
      double pMoney,
      String urlPhoto,
      bool acountActivated,
      String password) async {
    if (jobFunction == "Etudiant" ||
        jobFunction == "Comptable" ||
        jobFunction == "Resto") {
      return await userCollection.document(uid).setData({
        "uid": uid,
        'fullname': fullname,
        'jobFunction': jobFunction,
        'dept': dept,
        'classe': classe,
        'pMoney': pMoney,
        "urlPhoto": urlPhoto ?? null,
        'acountActivated': acountActivated,
        "password": password,
      });
    } else {
      return await userCollection.document(uid).setData({
        "uid": uid,
        'fullname': fullname,
        'jobFunction': jobFunction,
        'dept': dept,
        'classe': classe,
        'pMoney': pMoney,
        "urlPhoto": urlPhoto ?? null,
        'acountActivated': acountActivated,
      });
    }
  }

// Password for pMoney
  Future updatePassword(String password) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    return await userCollection.document(uid).updateData({
      "password": password,
    });
  }

  //User data from snapshot
  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      accountActivated: snapshot.data['acountActivated'],
      classe: snapshot.data['classe'],
      dept: snapshot.data['dept'],
      fullname: snapshot.data['fullname'],
      jobFunction: snapshot.data['jobFunction'],
      urlPhoto: snapshot.data['urlPhoto'],
      pMoney: snapshot.data['pMoney'],
      password: snapshot.data['password'],
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
  Future treansfertPMoney(
      String uidUser, double pMoney, String password) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String pwd = document.data["password"];
    try {
      if (pwd == password) {
        await userCollection.document(uidUser).updateData({
          'pMoney': FieldValue.increment(pMoney),
        });
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future etuTreansfertPMoney(
      String uidUser, double pMoney, String password) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final double solde = document.data["pMoney"];
    final String pwd = document.data["password"];

    try {
      if (solde >= pMoney && pwd == password) {
        await userCollection.document(uidUser).updateData({
          'pMoney': FieldValue.increment(pMoney),
        });
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-pMoney),
        });
        return userData;
      } else {
        return null;
      }
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
      } else if (jobFunction == "Admin") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("jobFunction")
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
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final double solde = document.data["pMoney"];
    //print(solde);
    try {
      if (scanResult == "Launch100" && solde >= 100.0) {
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-100),
        });
      } else if (scanResult == "breakFast50" && solde >= 50.0) {
        await userCollection.document(uid).updateData({
          'pMoney': FieldValue.increment(-50),
        });
      } else if (scanResult == "rent3000" && solde >= 3000.0) {
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

// Collection reference for User
  final CollectionReference presenceCollection =
      Firestore.instance.collection('presenceLogsData');

//Scan for presence service
  scanPresenceClass(String scanResult, DateTime currentDate) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String jobFunction = document.data["jobFunction"];
    final String fullname = document.data["fullname"];
    final String userClasse = document.data["classe"];
    final String userDept = document.data["dept"];
    final String presence = "Present";
    final String absence = "Absent";

    try {
      if (scanResult == "EXiTcLasSDIC2" && userClasse == "D.I.C.2") {
        return await presenceCollection.document(uid).setData({
          'jobFunction': jobFunction,
          'fullname': fullname,
          'exitDate': currentDate,
          'prensence': absence,
          "classe": "D.I.C.2",
          "dept": userDept,
        });
      } else if (scanResult == "eNtrycLaSsDIC2" && userClasse == "D.I.C.2") {
        return await presenceCollection.document(uid).setData({
          'jobFunction': jobFunction,
          'fullname': fullname,
          'exitDate': null,
          'entryDate': currentDate,
          'prensence': presence,
          "classe": "D.I.C.2",
          "dept": userDept,
        });
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //For presence List
  listPresence() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String jobFunction = document.data["jobFunction"];
    final String studentClass = document.data["classe"];
    final String userDept = document.data["dept"];

    print(userDept);
    try {
      if (jobFunction == "Etudiant") {
        return await Firestore.instance
            .collection('presenceLogsData')
            .orderBy("entryDate")
            .where(
              "classe",
              isEqualTo: studentClass,
            )
            .where("dept", isEqualTo: userDept)
            .getDocuments();
      } else if (jobFunction == "Professeur") {
        return await Firestore.instance
            .collection('presenceLogsData')
            .orderBy("entryDate")
            .where(
              "classe",
              isEqualTo: "D.I.C.2",
            )
            .where(
              "dept",
              isEqualTo: userDept,
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

//For Admin
  Future manageAccount(String uidUser) async {
    final DocumentSnapshot document =
        await userCollection.document(uidUser).get();
    final bool accountStatus = document.data["acountActivated"];
    //print(uid);
    try {
      await userCollection.document(uidUser).updateData({
        'acountActivated': !accountStatus,
      });
      return document;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //--------------------

  listUserForAdmin() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String jobFunction = document.data["jobFunction"];
    final String deptName = document.data["dept"];

    try {
      if (jobFunction == "Admin") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where("jobFunction", whereIn: [
          "Etudiant",
          "Comptable",
          "departmentChief"
        ]).getDocuments();
      } else if (jobFunction == "departmentChief") {
        return await Firestore.instance
            .collection('UserData')
            .orderBy("fullname")
            .where("jobFunction", isEqualTo: "Professeur")
            .where("dept", isEqualTo: deptName)
            .getDocuments();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //-----------------

  // Collection reference for admin Message
  final CollectionReference adminMessageCollection =
      Firestore.instance.collection('adminMessageData');

  Future updateMessage(
    String objet,
    String message,
  ) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    return await adminMessageCollection
        .document(uid)
        .setData({'object': objet, 'message': message});
  }

  //get Message
  getAdminMessage() async {
    return await Firestore.instance
        .collection('adminMessageData')
        .getDocuments();
  }

// For DEPARTMENTS INFO
  final CollectionReference deptInfoCollection =
      Firestore.instance.collection('DeptInfoData');

  Future updateDeptInfoData(
    String deptName,
    String deptChief,
    String resp1,
    String resp2,
    String resp3,
  ) async {
    if (deptName == "G.I.T") {
      return await deptInfoCollection
          .document("5SFLS4voexRoZvMeWBe50ts5tv03")
          .setData({
        "deptName": deptName,
        "deptChief": deptChief,
        "responsable1": resp1,
        "responsable2": resp2,
        "responsable3": resp3,
      });
    } else if (deptName == "G.E.M") {
      return await deptInfoCollection.document("gZr2tGSAHdA8hopXFbzz").setData({
        "deptName": deptName,
        "deptChief": deptChief,
        "responsable1": resp1,
        "responsable2": resp2,
        "responsable3": resp3,
      });
    } else if (deptName == "G.C") {
      return await deptInfoCollection.document("B33j4JHtBPlp49t4C039").setData({
        "deptName": deptName,
        "deptChief": deptChief,
        "responsable1": resp1,
        "responsable2": resp2,
        "responsable3": resp3,
      });
    } else if (deptName == "T.C") {
      return await deptInfoCollection.document("kTFgLLOZClXNMt7D5lia").setData({
        "deptName": deptName,
        "deptChief": deptChief,
        "responsable1": resp1,
        "responsable2": resp2,
        "responsable3": null,
      });
    } else {
      return null;
    }
  }

  //Get deptInfo
  getDeptInfo(String dept) async {
    if (dept == "G.I.T") {
      return await Firestore.instance
          .collection('DeptInfoData')
          .where("deptName", isEqualTo: "G.I.T")
          .getDocuments();
    } else if (dept == "G.E.M") {
      return await Firestore.instance
          .collection('DeptInfoData')
          .where("deptName", isEqualTo: "G.E.M")
          .getDocuments();
    } else if (dept == "G.C") {
      return await Firestore.instance
          .collection('DeptInfoData')
          .where("deptName", isEqualTo: "G.C")
          .getDocuments();
    } else if (dept == "T.C") {
      return await Firestore.instance
          .collection('DeptInfoData')
          .where("deptName", isEqualTo: "T.C")
          .getDocuments();
    } else {
      return null;
    }
  }

  //--List User for dept
  getUserInfo(UserData user, String option) async {
    final String deptName = user.dept;

    try {
      return await Firestore.instance
          .collection('UserData')
          .orderBy("classe" ?? "fullname")
          .where("dept", isEqualTo: deptName)
          .where("jobFunction", isEqualTo: option)
          .where("acountActivated", isEqualTo: true)
          .getDocuments();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
