import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';
import 'package:dartz/dartz.dart';

abstract class SetForgotPasswordRepo {
  Future<Either<Failure, SetForgotPasswordResponse>> setForgotPassword ({
    required SetForgotPasswordModel payload,
  });
}