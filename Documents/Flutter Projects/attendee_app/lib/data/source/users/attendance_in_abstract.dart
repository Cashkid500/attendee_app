import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';

abstract class AttendanceIn{
  Future<AttendanceInResponse> attendanceIn({
    required AttendanceInModel value,
  });
}