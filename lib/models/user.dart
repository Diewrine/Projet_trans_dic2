class User {
  final String uid;

  User(this.uid);
}

class UserData {
  final String uid;
  final String accountActivated;
  final String classe;
  final String dept;
  final String fullname;
  final String jobFunction;
  final double pMoney;
 String profilPhoto;

  UserData(
      {this.uid,
      this.accountActivated,
      this.classe,
      this.dept,
      this.fullname,
      this.jobFunction,
      this.pMoney,
      this.profilPhoto});
}
