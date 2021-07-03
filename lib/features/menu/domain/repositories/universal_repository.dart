import 'package:dartz/dartz.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/features/menu/domain/entities/menu.dart';

abstract class UniversalRepository {
  Future<Either<Failure, List<Menu>>> getMenus();
}
