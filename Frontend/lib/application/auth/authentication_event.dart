import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthenticationEvent {}

class SignOutEvent extends AuthenticationEvent {}
