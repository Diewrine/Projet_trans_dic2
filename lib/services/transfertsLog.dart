import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransfertsLog {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      Firestore.instance.collection('UserData');

  Future sendLog(String receiver, double montant) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final DocumentSnapshot document = await userCollection.document(uid).get();
    final String sender = document.data["fullname"];

    // here the codes to input the data into firestore

    try {
      // await DatabaseService(uid: uid).updateTransfertLog(
      await DatabaseService(uid: uid).updateTransfertLog(
        sender,
        receiver = receiver,
        montant = montant,
      );
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
