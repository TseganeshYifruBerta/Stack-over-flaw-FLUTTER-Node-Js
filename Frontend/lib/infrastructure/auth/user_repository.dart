import 'package:dartz/dartz.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/domain/auth/userModel.dart';
import '../../domain/domain.dart';

abstract class UserRepository {
  Future<Either<AuthFailure, UserModel>>? registerUser({
    required User user,
  });
  Future<Either<AuthFailure, UserModel>>? loginUser({
    required User user
  });

  Future<Either<AuthFailure, UserModel>>? editUser({
    required String token,
    required User user,
  });  
}
