import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';

abstract class SetForgotPasswordSource {
  Future<SetForgotPasswordResponse> setForgotPassword({
    required SetForgotPasswordModel payload,
  });
}