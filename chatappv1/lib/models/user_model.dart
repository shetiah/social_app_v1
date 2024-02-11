class UserModel {
  late String name;
  late String phone;
  late String email;
  late String uId;
  bool emailVerfied = false;
  UserModel(this.name, this.phone, this.email, this.uId,
      {this.emailVerfied = false});

  UserModel.fromJson(Map<String, dynamic> ?model) {
    name = model?['name'];
    phone = model?['phone'];
    email = model?['email'];
    uId = model?['uId'];
    emailVerfied = model?['emailVerfied'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'emailVerfied': emailVerfied
    };
  }
}
