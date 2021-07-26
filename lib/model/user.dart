class User {
  String firstname;
  String password;
  String email;
  String lastname;
  String phone;
  String organization, position;
  String oid;
  User(
      {this.firstname,
      this.password,
      this.email,
      this.lastname,
      this.phone,
      this.organization,
      this.position,
      this.oid});

  User.map(dynamic obj) {
    this.lastname = obj["lastname"];
    this.password = obj["password"];
    this.email = obj["email"];
    this.firstname = obj["firstname"];
    this.phone = obj["phone"];
    this.organization = obj["organization"];
    this.position = obj["position"];
    this.oid = obj["oid"];
  }

  String get firstname_str => firstname;
  String get password_str => password;
  String get email_str => email;
  String get lastname_str => lastname;
  String get phone_str => phone;
  String get organiszation_str => organization;
  String get position_str => position;
  String get oid_str => oid;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstname: json['userdata'][0]['firstName_str'] as String,
        password: json['userdata'][0]['password_str'] as String,
        email: json['userdata'][0]['email_str'] as String,
        lastname: json['userdata'][0]['lastName_str'] as String,
        phone: json['userdata'][0]['telephone_str'] as String,
        organization: json['userdata'][0]['organization_str'] as String,
        position: json['userdata'][0]['position_str'] as String,
        oid: json['userdata'][0]['OID'] as String

        //thumbnailUrl: json['thumbnailUrl'] as String,
        );
  }
}
