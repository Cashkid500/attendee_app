import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';

abstract class VerifyForgotPasswordSource {
  Future<VerifyForgotPasswordResponse> verifyForgotPassword({
    required VerifyForgotPasswordModel payload,
  });
}
