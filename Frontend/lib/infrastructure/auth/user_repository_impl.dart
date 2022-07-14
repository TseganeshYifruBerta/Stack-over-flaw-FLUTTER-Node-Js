import 'package:please/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/infrastructure/auth/user_repository.dart';
import '../../domain/auth/userModel.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRepository userRepository;

  UserRepositoryImpl(this.userRepository);

  @override
  Future<Either<AuthFailure, UserModel>>? loginUser({required User user}) {
    print('hey repo');
    return userRepository.loginUser(user: user);
  }

  @override
  Future<Either<AuthFailure, UserModel>>? registerUser({required User user}) {
    return userRepository.registerUser(user: user);
  }

  @override
  Future<Either<AuthFailure, UserModel>>? editUser(
      {required String token, required User user}) {
    return userRepository.editUser(token: token, user: user);
  }
}
