import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference for User
  final CollectionReference userCollection =
      Firestore.instance.collection('UserData');

  Future updateUserData(String fullname, String jobFunction, String dept,
      String classe, int pMoney, bool acountActivated) async {
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
        .where("jobFunction", isEqualTo: "Etudiant")
        .getDocuments();
  }

  // get users doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userData);
  }
}
