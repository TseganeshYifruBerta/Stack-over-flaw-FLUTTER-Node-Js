import 'package:equatable/equatable.dart';

class SharedPreference extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final bool isAdmin;

  String get getName => name;
  String get getEmail => email;
  String get getId => id;
  String get getToken => token;

  SharedPreference( 
      {required this.id,
      required this.name,
      required this.email,
      required this.isAdmin,
      required this.token});

  factory SharedPreference.fromJson(Map<String, dynamic> json) {
    return SharedPreference(
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
