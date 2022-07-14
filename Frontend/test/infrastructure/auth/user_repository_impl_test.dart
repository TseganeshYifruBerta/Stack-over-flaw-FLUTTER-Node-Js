import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:please/domain/auth/auth_failure.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:please/infrastructure/infrastructure.dart';

class MockRemoteUserDataProvider extends Mock
    implements RemoteUserDataProvider {}

void main() {
  late UserRepositoryImpl userRepositoryImpl;
  late MockRemoteUserDataProvider mockRemoteUserDataProvider;

  setUp(() {
    mockRemoteUserDataProvider = MockRemoteUserDataProvider();
    userRepositoryImpl = UserRepositoryImpl(mockRemoteUserDataProvider);
  });
  final User user = User('name', 'email@gmail.com', 'password');

  final model = UserModel(
      id: 'id',
      name: 'name',
      email: 'email@gmail.com',
      isAdmin: false,
      token: 'token');

  Either<AuthFailure, UserModel>? responseModel = Right(model);

  group('register user', () {
    test('should return 200 for registering a valid user', () async {
      when(mockRemoteUserDataProvider.registerUser(user: user))
          .thenAnswer((_) async => responseModel);

      final result = await userRepositoryImpl.registerUser(user: user);

      verify(mockRemoteUserDataProvider.registerUser(user: user));
      expect(result, responseModel);
    });

    test(
        'should return user already registered failure a user try to register with existing email',
        () async {
      when(mockRemoteUserDataProvider.registerUser(user: user))
          .thenAnswer((_) async => const Left(AuthFailure.emailAlreadyInUse()));

      final result = await userRepositoryImpl.registerUser(user: user);

      verify(mockRemoteUserDataProvider.registerUser(user: user));
      expect(result, const Left(AuthFailure.emailAlreadyInUse()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockRemoteUserDataProvider.registerUser(user: user))
          .thenAnswer((_) async => const Left(AuthFailure.serverError()));

      final result = await userRepositoryImpl.registerUser(user: user);

      verify(mockRemoteUserDataProvider.registerUser(user: user));
      expect(result, const Left(AuthFailure.serverError()));
    });
  });
  group('login user', () {
    test('should return 200 for logging a valid user', () async {
      when(mockRemoteUserDataProvider.loginUser(user: user))
          .thenAnswer((_) async => responseModel);

      final result = await userRepositoryImpl.loginUser(user: user);

      verify(mockRemoteUserDataProvider.loginUser(user: user));
      expect(result, responseModel);
    });

    test(
        'should return invalid email and password combination failure a user try to login with invalid value',
        () async {
      when(mockRemoteUserDataProvider.loginUser(user: user)).thenAnswer(
          (_) async =>
              const Left(AuthFailure.invalidEmailAndPasswordCombination()));

      final result = await userRepositoryImpl.loginUser(user: user);

      verify(mockRemoteUserDataProvider.loginUser(user: user));
      expect(
          result, const Left(AuthFailure.invalidEmailAndPasswordCombination()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockRemoteUserDataProvider.loginUser(user: user))
          .thenAnswer((_) async => const Left(AuthFailure.serverError()));

      final result = await userRepositoryImpl.loginUser(user: user);

      verify(mockRemoteUserDataProvider.loginUser(user: user));
      expect(result, const Left(AuthFailure.serverError()));
    });
  });

  group('update user profile', () {
    final String token = 'token';
    test('should return 200 for logging a valid user', () async {
      when(mockRemoteUserDataProvider.editUser(user: user, token: token))
          .thenAnswer((_) async => responseModel);

      final result =
          await userRepositoryImpl.editUser(user: user, token: token);

      verify(mockRemoteUserDataProvider.editUser(user: user, token: token));
      expect(result, responseModel);
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockRemoteUserDataProvider.editUser(user: user, token: token))
          .thenAnswer((_) async => const Left(AuthFailure.serverError()));

      final result =
          await userRepositoryImpl.editUser(user: user, token: token);

      verify(mockRemoteUserDataProvider.editUser(user: user, token: token));
      expect(result, const Left(AuthFailure.serverError()));
    });
  });
}
