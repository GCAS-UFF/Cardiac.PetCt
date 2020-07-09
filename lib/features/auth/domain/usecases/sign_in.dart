import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';

class SignIn implements UseCase<String, Params> {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<Either<Failure, String>> call(Params params) async {
    return await repository.signIn(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
