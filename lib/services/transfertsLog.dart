import 'package:dic2_project_trans/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransfertsLog {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future sendLog(String sendBy, String receiver, double montant) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    print(uid);
    // here the codes to input the data into firestore

    try {
      // await DatabaseService(uid: uid).updateTransfertLog(
      await DatabaseService(uid: uid).updateTransfertLog(
        sendBy = sendBy,
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
