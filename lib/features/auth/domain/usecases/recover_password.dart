import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';

class RecoverPassword implements UseCase<void, Params> {
  final AuthRepository repository;

  RecoverPassword(this.repository);

  Future<Either<Failure, void>> call(Params params) async {
    return await repository.recoverPassword(params.email);
  }
}

class Params extends Equatable {
  final String email;

  Params({@required this.email});

  @override
  List<Object> get props => [email];
}
