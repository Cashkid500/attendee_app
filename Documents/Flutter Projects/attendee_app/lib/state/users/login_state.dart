import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/login.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final Failure failure;
  LoginFailure({required this.failure});
}
class LoginSuccess extends LoginState {
  final LoginResponse responseData;
  LoginSuccess({required this.responseData});
}