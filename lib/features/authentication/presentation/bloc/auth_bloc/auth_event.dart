part of 'auth_bloc.dart';

abstract class AuthEvent {}

class PhoneNoValidEvent extends AuthEvent{
  final String phoneNo;

  PhoneNoValidEvent({
    required this.phoneNo,
  });
}

class PhoneNoInValidEvent extends AuthEvent{
}

class SendCodeEvent extends AuthEvent{

}

class CodeValidEvent extends AuthEvent{

}

class CodeInValidEvent extends AuthEvent{
}

class ContinueEvent extends AuthEvent{
  
}