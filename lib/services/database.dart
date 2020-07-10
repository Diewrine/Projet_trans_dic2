import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/screens/etudiant.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference for Etudiant
  final CollectionReference etudiantCollection =
      Firestore.instance.collection('EtudiantData');

  Future updateEtudiantData(String fullname, String jobFonction, String dept,
      String classe, int pMoney, bool acountActivated) async {
    return await etudiantCollection.document(uid).setData({
      'fullname': fullname,
      'jobFonction': jobFonction,
      'dept': dept,
      'classe': classe,
      'pMoney': pMoney,
      'acountActivated': acountActivated,
    });
  }

  // Collection reference for Professeur
  final CollectionReference professeurCollection =
      Firestore.instance.collection('ProfesseurData');

  Future updateProfesseurData(String fullname, String jobFonction, String dept,
      bool acountActivated) async {
    return await professeurCollection.document(uid).setData({
      'fullname': fullname,
      'jobFonction': jobFonction,
      'dept': dept,
      'acountActivated': acountActivated,
    });
  }

  // Collection reference for Comptable
  final CollectionReference comptableCollection =
      Firestore.instance.collection('comptableData');

  Future updateComptableData(String fullname, String jobFonction, int pMoney,
      bool acountActivated) async {
    return await comptableCollection.document(uid).setData({
      'fullname': fullname,
      'jobFonction': jobFonction,
      'pMoney': pMoney,
      'acountActivated': acountActivated,
    });
  }

  // Collection reference for Departement
  final CollectionReference departmentCollection =
      Firestore.instance.collection('departmentData');

  Future updateDepartmentData(String fullname, String jobFonction, String dept,
      bool acountActivated) async {
    return await departmentCollection.document(uid).setData({
      'fullname': fullname,
      'jobFonction': jobFonction,
      'dept': dept,
      'acountActivated': acountActivated,
    });
  }

  //--------------end of class Database
  // Etudiant data from snapshot
  EtudiantData _etudiantDataFromSnapshot(DocumentSnapshot snapshot){
    return EtudiantData(
      uid:uid,
      fullname:snapshot.data['fulname'],
      jobFonction :snapshot.data['jobFonction'],
      dept : snapshot.data['dept'],
      classe :snapshot.data['classe'],
      pMoney :snapshot.data['pMoney'],
      acountActivated:snapshot.data['acountActivated'],
    );
  }


  //get etudiant doc stream
  Stream<EtudiantData> get etudiantData{
    return etudiantCollection.document(uid).snapshots().map(_etudiantDataFromSnapshot);
  }
  
}
