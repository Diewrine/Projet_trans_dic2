import 'package:dic2_project_trans/screens/etudiant.dart';

class User {
  final String uid;

  User(this.uid);
}

class EtudiantData{
  final String uid;
  final String fullname ;
  final String jobFonction ;
  final String dept ;
  final String classe ;
  final int  pMoney ;
  final bool acountActivated;

  EtudiantData({this.uid,this.fullname,this.jobFonction,this.dept,this.classe,this.pMoney,this.acountActivated});
}
