import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:petct/features/auth/domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp signUp;

  AuthBloc({@required this.signUp}) : assert(signUp != null);

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignUpEvent) {
      yield Loading();
      var userOrError =
          await signUp(Params(user: event.user, password: event.password));
      userOrError.fold((failure) => Error(failure: failure),
          (user) => Registred(user: user));
    }
  }
}
