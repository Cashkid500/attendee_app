import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';
import 'package:dartz/dartz.dart';

abstract class AttendanceOutRepo{
  Future<Either<Failure, AttendanceOutResponse>> attendanceOut({
    required AttendanceOutModel value,
  });

}