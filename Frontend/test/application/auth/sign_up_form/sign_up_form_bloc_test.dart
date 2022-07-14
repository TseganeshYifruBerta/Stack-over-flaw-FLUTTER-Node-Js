import 'dart:html';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:please/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:please/domain/auth/auth_failure.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:please/domain/domain.dart';
import 'package:please/infrastructure/auth/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();

  });
  final userModel = UserModel(
      id: 'id',
      name: 'name',
      email: 'email@gmail.com',
      isAdmin: false,
      token: 'token');

  Either<AuthFailure, UserModel> model = Right(userModel);

  group('on name change event ', () {
    // const name = 'a';
    blocTest('should get the name in the name',
        build: () => UserBloc(userRepository: userRepository),
        act: (bloc)=> const RegisterWithEmailAndPasswordPressed(),
        expect: () => [],
        verify: (state) => state
        );
  });
}
