class Admin{
  String name, email, password;


  Admin({this.name, this.email, this.password});

  bool verifyPassword(String pass){
    return this.password == pass;
  }

}