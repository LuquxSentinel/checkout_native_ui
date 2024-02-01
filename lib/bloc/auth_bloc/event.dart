import 'package:equatable/equatable.dart';

class AuthenticatonEvent extends Equatable {
  const AuthenticatonEvent();

  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthenticatonEvent {
  final String email;
  final String token;

  const LoggedInEvent({required this.email, required this.token});
}

class LoggedOutEvent extends AuthenticatonEvent {}

class AppStartedEvent extends AuthenticatonEvent {}
