import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';

// Forgot Password State
class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
    final Failure failure;
    ForgotPasswordFailure({required this.failure});
}

class ForgotPasswordSuccess extends ForgotPasswordState {
    final ForgotPasswordResponse responseData;
    ForgotPasswordSuccess({required this.responseData});
}

// Set Forgot Password State
class SetForgotPasswordState {}

class SetForgotPasswordInitial extends SetForgotPasswordState {}

class SetForgotPasswordLoading extends SetForgotPasswordState {}

class SetForgotPasswordFailure extends SetForgotPasswordState {
    final Failure failure;
    SetForgotPasswordFailure({required this.failure});
}

class SetForgotPasswordSuccess extends SetForgotPasswordState {
    final SetForgotPasswordResponse responseData;
    SetForgotPasswordSuccess({required this.responseData});
}

// Verify Forgot Password State
class VerifyForgotPasswordState {}

class VerifyForgotPasswordInitial extends VerifyForgotPasswordState {}

class VerifyForgotPasswordLoading extends VerifyForgotPasswordState {}

class VerifyForgotPasswordFailure extends VerifyForgotPasswordState {
    final Failure failure;
    VerifyForgotPasswordFailure({required this.failure});
}

class VerifyForgotPasswordSuccess extends VerifyForgotPasswordState {
    final VerifyForgotPasswordResponse responseData;
    VerifyForgotPasswordSuccess({required this.responseData});
}

// Update Password State
class UpdatePasswordState {}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoading extends UpdatePasswordState {}

class UpdatePasswordFailure extends UpdatePasswordState {
    final Failure failure;
    UpdatePasswordFailure({required this.failure});
}

class UpdatePasswordSuccess extends UpdatePasswordState {
    final UpdatePasswordResponse responseData;
    UpdatePasswordSuccess({required this.responseData});
}
