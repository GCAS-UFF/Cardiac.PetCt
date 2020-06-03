import 'package:dartz/dartz.dart';
import 'package:petct/features/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp (User user, String password);
}