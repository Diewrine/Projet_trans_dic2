class User {
  final String uid;

  User(this.uid);
}

class UserData {
  final String uid;
  final bool accountActivated;
  final String classe;
  final String dept;
  final String fullname;
  final String jobFunction;
  final String urlPhoto;
  final double pMoney;

  UserData(
      {this.uid,
      this.accountActivated,
      this.classe,
      this.dept,
      this.fullname,
      this.jobFunction,
      this.urlPhoto,
      this.pMoney});
}
