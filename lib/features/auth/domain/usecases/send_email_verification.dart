import 'package:dartz/dartz.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';

class SendEmailVerification implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SendEmailVerification(this.repository);

  Future<Either<Failure, void>> call(NoParams noParams) async {
    return await repository.sendEmailVerification();
  }
}
