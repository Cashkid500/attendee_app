import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';

abstract class AttendanceOut {
  Future<AttendanceOutResponse> attendanceOut({
    required AttendanceOutModel value,
  });
}