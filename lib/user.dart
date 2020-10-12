User sampleU = new User('Thomas','Jones',new DateTime.now(),'k1816028@gmail.com','savannah23');


class User{
  String firstName;
  String lastName;
  DateTime dob;
  String email;
  String password;

  User(String fn, String ln, DateTime d, String e, String p){
    this.firstName = fn;
    this.lastName = ln;
    this.dob = d;
    this.email = e;
    this.password = p;
  }

  String getFirstName(){return this.firstName;}
  void setFirstName(String fn){this.firstName = fn;}

  String getLastName(){return this.lastName;}
  void setLastName(String ln){this.lastName = ln;}

  DateTime getDob() {return this.dob;}
  void setDob(DateTime d) {this.dob = d;}

  String getEmail(){return this.email;}
  void setEmail(String e){this.email = e;}

  String getPassword(){return this.password;}
  void setPassword(String p){this.password = p;}
}