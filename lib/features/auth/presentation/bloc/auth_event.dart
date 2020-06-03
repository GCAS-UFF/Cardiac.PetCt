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
