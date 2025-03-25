import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';
import 'package:dartz/dartz.dart';

abstract class AttendanceInRepo{
  Future<Either<Failure, AttendanceInResponse>> attendanceIn({
    required AttendanceInModel value,
  });
}