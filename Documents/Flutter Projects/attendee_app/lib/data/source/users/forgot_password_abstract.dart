import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';

abstract class ForgotPasswordSource{
  Future<ForgotPasswordResponse> forgotPassword({
    required ForgotPasswordModel payload,
  });
}