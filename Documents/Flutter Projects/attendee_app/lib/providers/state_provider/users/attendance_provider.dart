import 'package:attendee_app/state/users/attendance_notifier.dart';
import 'package:attendee_app/state/users/attendance_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// AttendanceIn
final attendanceInStateNotifierProvider =
    StateNotifierProvider<AttendanceInStateNotifier, AttendanceInState>(
  (ref) => AttendanceInStateNotifier(ref),
);

// AttendanceOut
final attendanceOutStateNotifierProvider =
    StateNotifierProvider<AttendanceOutStateNotifier, AttendanceOutState>(
  (ref) => AttendanceOutStateNotifier(ref),
);