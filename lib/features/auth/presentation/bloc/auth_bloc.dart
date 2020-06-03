import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/usecases/usecase.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:petct/features/auth/domain/usecases/confirm_email_verified.dart';
import 'package:petct/features/auth/domain/usecases/recover_password.dart'
    as recover;
import 'package:petct/features/auth/domain/usecases/send_email_verification.dart';
import 'package:petct/features/auth/domain/usecases/sign_in.dart' as sign_in;
import 'package:petct/features/auth/domain/usecases/sign_out.dart';
import 'package:petct/features/auth/domain/usecases/sign_up.dart' as sign_up;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final sign_in.SignIn signIn;
  final sign_up.SignUp signUp;
  final SignOut signOut;
  final recover.RecoverPassword recoverPassword;
  final SendEmailVerification sendEmailVerification;
  final ConfirmEmailVerified confirmEmailVerified;

  AuthBloc({
    @required this.signUp,
    @required this.signIn,
    @required this.signOut,
    @required this.recoverPassword,
    @required this.sendEmailVerification,
    @required this.confirmEmailVerified,
  })  : assert(signUp != null),
        assert(signIn != null),
        assert(signOut != null),
        assert(recoverPassword != null),
        assert(sendEmailVerification != null),
        assert(confirmEmailVerified != null);

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignUpEvent) {
      yield Loading();
      var userOrError = await signUp(
          sign_up.Params(user: event.user, password: event.password));
      yield userOrError.fold(
          (failure) => Error(failure: failure), (user) => Loaded());
    } else if (event is SignInEvent) {
      yield Loading();
      final failureOrString = await signIn(
          sign_in.Params(email: event.email, password: event.password));
      yield* _eitherLoadedOrErrorStateWithString(failureOrString);
    } else if (event is SignOutEvent) {
      yield Loading();
      final failureOrVoid = await signOut(NoParams());
      yield* _eitherLoadedOrErrorStateWithVoid(failureOrVoid);
    } else if (event is ResentEmailEvent) {
      yield Loading();
      final failureOrVoid = await sendEmailVerification(NoParams());
      yield* _eitherInitialOrErrorStateWithVoid(failureOrVoid);
    } else if (event is ConfirmEmailVerifiedEvent) {
      yield Loading();
      final failureOrBool = await confirmEmailVerified(NoParams());
      yield* _eitherLoadedOrErrorStateWithBool(failureOrBool);
    } else if (event is RecoverPasswordEvent) {
      yield Loading();
      final failureOrVoid =
          await recoverPassword(recover.Params(email: event.email));
      yield* _eitherLoadedOrErrorStateWithVoid(failureOrVoid);
    }
  }

  Stream<AuthState> _eitherInitialOrErrorStateWithVoid(
    Either<Failure, void> failureOrVoid,
  ) async* {
    yield failureOrVoid.fold(
      (failure) {
        return Error(failure: failure);
      },
      (result) => EmailResent(),
    );
  }

  Stream<AuthState> _eitherLoadedOrErrorStateWithVoid(
    Either<Failure, void> failureOrVoid,
  ) async* {
    yield failureOrVoid.fold(
      (failure) {
        return Error(failure: failure);
      },
      (result) => Loaded(),
    );
  }

  Stream<AuthState> _eitherLoadedOrErrorStateWithBool(
    Either<Failure, bool> failureOrVoid,
  ) async* {
    yield failureOrVoid.fold((failure) {
      return Error(failure: failure);
    }, (result) {
      if (result)
        return Loaded();
      else
        return AuthInitial();
    });
  }

  Stream<AuthState> _eitherLoadedOrErrorStateWithString(
    Either<Failure, String> failureOrString,
  ) async* {
    yield failureOrString.fold(
      (failure) {
        if (failure is EmailNotVerifiedFailure) {
          return EmailNotVerifiedState();
        } else {
          return Error(failure: failure);
        }
      },
      (userId) => Loaded(),
    );
  }
}
