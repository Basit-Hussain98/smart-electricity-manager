class AppUser{
  String name, email, password;


  AppUser({this.name, this.email, this.password});

  bool verifyPassword(String pass){
    return this.password == pass;
  }

}