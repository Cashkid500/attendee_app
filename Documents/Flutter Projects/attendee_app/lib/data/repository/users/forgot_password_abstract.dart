import 'package:attendee_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword ({
    required ForgotPasswordModel payload,
  });
}