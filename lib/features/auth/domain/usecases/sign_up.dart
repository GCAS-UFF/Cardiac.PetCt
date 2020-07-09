import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/usecases/usecase.dart';

class SignUp extends UseCase<User, Params> {
  final AuthRepository repository;

  SignUp (this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.signUp(params.user, params.password);
  }
}

class Params extends Equatable {
  final User user;
  final String password;

  Params ({@required this.password, @required this.user});

  @override
  List<Object> get props => [user, password];
}