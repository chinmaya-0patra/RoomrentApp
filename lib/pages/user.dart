class User {
  final String id;
  final String fname;
  final String lname;
  final String email;
  final String number;
  final String password;
  final String confirmpassword;

  User(
      {this.id,
      this.fname,
      this.email,
      this.lname,
      this.number,
      this.password,
      this.confirmpassword});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fname = data['fname'],
        lname = data['lname'],
        email = data['email'],
        number = data['number'],
        password = data['password'],
        confirmpassword = data['confirmpassword'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'number': number,
      'password': password,
      'confirmpassword': confirmpassword,
    };
  }
}
