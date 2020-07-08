import 'package:dic2_project_trans/models/user.dart';
import 'package:dic2_project_trans/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(user.uid) : null;
  }

  // auth change user Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // Test for Sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future register(String email, String password, String fullname,
      String jobFonction, String dept, String classe, int pMoney) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // condition for creating new record
      if (jobFonction == "Etudiant") {
        // create a new user record for Etudiant;
        await DatabaseService(uid: user.uid).updateEtudiantData(
          fullname = fullname,
          jobFonction = jobFonction,
          dept = dept,
          classe = classe,
          pMoney = pMoney,
          false,
        );
      } else if (jobFonction == "Professeur") {
        // create a new user record for Professeur;
        await DatabaseService(uid: user.uid).updateProfesseurData(
          fullname = fullname,
          jobFonction = jobFonction,
          dept = dept,
          false,
        );
      } else if (jobFonction == "Comptable") {
        // create a new user record for Comptable;
        await DatabaseService(uid: user.uid).updateComptableData(
          fullname = fullname,
          jobFonction = jobFonction,
          pMoney = pMoney,
          false,
        );
      } else if (jobFonction == "departmentChief") {
        // create a new user record for Departement;
        await DatabaseService(uid: user.uid).updateDepartmentData(
          fullname = fullname,
          jobFonction = jobFonction,
          dept = dept,
          false,
        );
      }

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign with email and password
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
