import 'package:flutter/services.dart';
import 'package:petct/core/error/exception.dart';
import 'package:petct/core/platform/networkinfo.dart';
import 'package:petct/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petct/features/auth/data/datasources/local_data_source.dart';
import 'package:petct/features/auth/data/model/user_model.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:petct/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, User>> signUp(User user, String password) async {
    if (await networkInfo.isConnected) {
      try {
        User userResult =
            await remoteDataSource.signUp(UserModel.fromEntity(user), password);
        await localDataSource.saveUserId(userResult.id);
        return Right(userResult);
      } on CacheException {
        return Left(CacheFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on PlatformException catch (e) {
        return Left(PlatformFailure(code: e.code, message: e.message));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
