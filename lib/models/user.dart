class User {
  final String uid;

  User(this.uid);
}

// class EtudiantData {
//   final String uid;
//   final String accountActivated;
//   final String classe;
//   final String dept;
//   final String fullname;
//   final String jobFunction;
//   final int pMoney;

//   EtudiantData(
//       {this.uid,
//       this.accountActivated,
//       this.classe,
//       this.dept,
//       this.fullname,
//       this.jobFunction,
//       this.pMoney});
// }

class UserData {
  final String uid;
  final String accountActivated;
  final String classe;
  final String dept;
  final String fullname;
  final String jobFunction;
  final double pMoney;

  UserData(
      {this.uid,
      this.accountActivated,
      this.classe,
      this.dept,
      this.fullname,
      this.jobFunction,
      this.pMoney});
}
