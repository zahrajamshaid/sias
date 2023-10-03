
class UserModel {
  String uid;
  String username;
  String phoneNumber;
  String email;
 String id;
 String location;
String password;

  UserModel({
    required this.uid,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.id,
    required this.location,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      username: json['username'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      location: json['location'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'id': id,
      'location': location,
      'password': password,
    };
  }
}