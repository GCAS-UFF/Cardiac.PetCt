import 'package:petct/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/menu/domain/entities/menu.dart';
import 'package:petct/features/menu/domain/repositories/universal_repository.dart';

class GetAllMenus extends UseCase<List<Menu>, NoParams> {
  final UniversalRepository universalRepository;

  GetAllMenus(this.universalRepository);

  @override
  Future<Either<Failure, List<Menu>>> call(NoParams params) async {
    return await universalRepository.getMenus();
  }
}
