import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if(event is PhoneNoValidEvent){
        emit(PhoneNoValidState(phoneNo: event.phoneNo));
      } else if(event is PhoneNoInValidEvent){
        emit(PhoneNoInValidState());
      } else if(event is SendCodeEvent){
        emit(SendCodeState());
      } else if(event is ContinueEvent){
        emit(ContinueState());
      } else if(event is CodeValidEvent){
        emit(CodeValidState());
      }
    });
  }
}
