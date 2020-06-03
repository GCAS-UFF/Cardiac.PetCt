import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:petct/features/auth/domain/usecases/confirm_email_verified.dart';
import 'package:petct/features/auth/domain/usecases/recover_password.dart';
import 'package:petct/features/auth/domain/usecases/send_email_verification.dart';
import 'package:petct/features/auth/domain/usecases/sign_in.dart';
import 'package:petct/features/auth/domain/usecases/sign_out.dart';
import 'package:petct/features/auth/domain/usecases/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/networkinfo.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/datasources/local_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

// Start getIT
final sl = GetIt.instance;

Future<void> init() async {
  // Initialize all features
  _initAuth();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}

void _initAuth() {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      signUp: sl(),
      confirmEmailVerified: sl(),
      recoverPassword: sl(),
      sendEmailVerification: sl(),
      signIn: sl(),
      signOut: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => ConfirmEmailVerified(sl()));
  sl.registerLazySingleton(() => RecoverPassword(sl()));
  sl.registerLazySingleton(() => SendEmailVerification(sl()));
  sl.registerLazySingleton(() => SignIn(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: sl(),
      firebaseDatabase: sl(),
    ),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}
