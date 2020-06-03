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
      // Run the code inside send a request for a treat all possible exceptions
      return await sendRequest(makeRequest: () async {
        User userResult =
            await remoteDataSource.signUp(UserModel.fromEntity(user), password);
        await localDataSource.saveUserId(userResult.id);
        return Right(userResult);
      });
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> confirmEmailVerified() async {
    if (await networkInfo.isConnected) {
      // Run the code inside send a request for a treat all possible exceptions
      return await sendRequest(makeRequest: () async {
        bool result = await remoteDataSource.confirmEmailVerified();
        return Right(result);
      });
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> recoverPassword(String email) async {
    if (await networkInfo.isConnected) {
      // Run the code inside send a request for a treat all possible exceptions
      return await sendRequest(makeRequest: () async {
        return Right(await remoteDataSource.recoverPassword(email));
      });
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      // Run the code inside send a request for a treat all possible exceptions
      return await sendRequest(makeRequest: () async {
        return Right(await remoteDataSource.sendEmailVerification());
      });
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signIn(String email, String password) async {
    if (await networkInfo.isConnected) {
      // Run the code inside send a request for a treat all possible exceptions
      return await sendRequest(makeRequest: () async {
        final String userId = await remoteDataSource.signIn(email, password);
        localDataSource.saveUserId(userId);
        return Right(userId);
      });
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    // Run the code inside send a request for a treat all possible exceptions
    return await sendRequest(makeRequest: () async {
      await remoteDataSource.signOut();
      return Right(await localDataSource.cleanCache());
    });
  }

  // Function to get all exceptions and return failures
  Future<Either<Failure, dynamic>> sendRequest(
      {@required Function makeRequest}) async {
    try {
      Right(await makeRequest());
      return Right(true);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on EmailNotVerifiedException {
      return Left(EmailNotVerifiedFailure());
    } on PlatformException catch (e) {
      return Left(PlatformFailure(code: e.code, message: e.message));
    }
  }
}
