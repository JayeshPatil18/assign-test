part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class PhoneNoValidState extends AuthState {
  final String phoneNo;

  PhoneNoValidState({
    required this.phoneNo,
  });
}

class PhoneNoInValidState extends AuthState {}

class CodeValidState extends AuthState {}

class SendCodeState extends AuthState {}

class ContinueState extends AuthState {}
