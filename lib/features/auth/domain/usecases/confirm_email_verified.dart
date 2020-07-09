import 'package:dartz/dartz.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';

class ConfirmEmailVerified implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  ConfirmEmailVerified(this.repository);

  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await repository.confirmEmailVerified();
  }
}
