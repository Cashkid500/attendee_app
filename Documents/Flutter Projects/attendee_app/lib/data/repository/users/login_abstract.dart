import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo{
  Future<Either<Failure,LoginResponse>> login({
    required LoginModel value,
  });
}