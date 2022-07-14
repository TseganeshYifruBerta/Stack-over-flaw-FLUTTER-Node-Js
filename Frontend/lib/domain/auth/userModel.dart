import 'package:equatable/equatable.dart';

class User extends Equatable {
  String name;
  String email;
  String password;

  String get getName => name;
  String get getEmail => email;
  String get getPassword => password;

  User(this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['password'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password};

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password];
}
