import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';

class AttendanceInState {}

class AttendanceInInitial extends AttendanceInState {}

class AttendanceInLoading extends AttendanceInState {}

class AttendanceInFailure extends AttendanceInState {
  final Failure failure;
  AttendanceInFailure({required this.failure});
}

class AttendanceInSuccess extends AttendanceInState {
  final AttendanceInResponse responseData;
  AttendanceInSuccess({required this.responseData});
}

class AttendanceOutState {}

class AttendanceOutInitial extends AttendanceOutState {}

class AttendanceOutLoading extends AttendanceOutState {}

class AttendanceOutFailure extends AttendanceOutState {
  final Failure failure;
  AttendanceOutFailure({required this.failure});
}
class AttendanceOutSuccess extends AttendanceOutState {
  final AttendanceOutResponse responseData;
  AttendanceOutSuccess({required this.responseData});
}