import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthencationLoggingOut extends AuthenticationState {}

class AuthenticationUninitialized extends AuthenticationState {}
