import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  String id;
  String name;
  String email;
  bool isAdmin;
  String token;

  Authenticated(
      {required this.id,
      required this.name,
      required this.email,
      required this.isAdmin,
      required this.token});
}

class UnAutheticated extends AuthenticationState {
  UnAutheticated();
}
