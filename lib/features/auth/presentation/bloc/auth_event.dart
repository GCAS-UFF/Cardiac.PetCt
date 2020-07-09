part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final User user;
  final String password;

  SignUpEvent({@required this.user, @required this.password});

  @override
  List<Object> get props => [user, password];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

class ResentEmailEvent extends AuthEvent {}

class ConfirmEmailVerifiedEvent extends AuthEvent {}

class RecoverPasswordEvent extends AuthEvent {
  final String email;

  RecoverPasswordEvent({@required this.email});

  @override
  List<Object> get props => [email];
}

