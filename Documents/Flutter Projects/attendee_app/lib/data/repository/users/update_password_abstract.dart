import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';
import 'package:dartz/dartz.dart';

abstract class UpdatePasswordRepo {
  Future<Either<Failure, UpdatePasswordResponse>> updatePassword ({
    required UpdatePasswordModel payload,
  });
}