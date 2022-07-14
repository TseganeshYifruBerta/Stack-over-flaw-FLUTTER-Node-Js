import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final bool isAdmin;

  String get getName => name;
  String get getEmail => email;
  String get getId => id;
  String get getToken => token;

  UserModel( 
      {required this.id,
      required this.name,
      required this.email,
      required this.isAdmin,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isAdmin: json['isAdmin'] as bool,
      token: json['token'], 
     
    );
  }

  @override
  List<Object?> get props => [id, name, email, isAdmin, token];
}
