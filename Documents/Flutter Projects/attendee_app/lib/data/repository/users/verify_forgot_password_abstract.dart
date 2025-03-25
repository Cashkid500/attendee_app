import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';
import 'package:dartz/dartz.dart';

abstract class VerifyForgotPasswordRepo {
  Future<Either<Failure, VerifyForgotPasswordResponse>> verifyForgotPassword ({
    required VerifyForgotPasswordModel payload,
  });
}