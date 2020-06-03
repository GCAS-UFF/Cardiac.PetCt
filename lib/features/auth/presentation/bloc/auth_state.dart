part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Loading extends AuthState {}

class Registred extends AuthState {
  final User user;

  Registred({@required this.user});

  List<Object> get props => [user];
}

class Error extends AuthState {
  final Failure failure;

  Error({@required this.failure});

  List<Object> get props => [failure];
}
