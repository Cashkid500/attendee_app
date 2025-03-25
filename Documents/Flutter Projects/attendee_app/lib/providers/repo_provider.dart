import 'package:attendee_app/data/repository/users/attendance_in_abstract.dart';
import 'package:attendee_app/data/repository/users/attendance_in_impl.dart';
import 'package:attendee_app/data/repository/users/attendance_out_abstract.dart';
import 'package:attendee_app/data/repository/users/attendance_out_impl.dart';
import 'package:attendee_app/data/repository/users/edit_profile_abstract.dart';
import 'package:attendee_app/data/repository/users/edit_profile_impl.dart';
import 'package:attendee_app/data/repository/users/fetch_notification_abstract.dart';
import 'package:attendee_app/data/repository/users/fetch_notification_impl.dart';
import 'package:attendee_app/data/repository/users/forgot_password_abstract.dart';
import 'package:attendee_app/data/repository/users/forgot_password_impl.dart';
import 'package:attendee_app/data/repository/users/get_calendar_abstract.dart';
import 'package:attendee_app/data/repository/users/get_calendar_impl.dart';
import 'package:attendee_app/data/repository/users/login_abstract.dart';
import 'package:attendee_app/data/repository/users/login_impl.dart';
import 'package:attendee_app/data/repository/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/data/repository/users/set_forgot_password_impl.dart';
import 'package:attendee_app/data/repository/users/update_password_abstract.dart';
import 'package:attendee_app/data/repository/users/update_password_impl.dart';
import 'package:attendee_app/data/repository/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/data/repository/users/verify_forgot_password_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Forgot Password
final forgotPasswordRepositoryProvider = Provider<ForgotPasswordRepo>(
  (ref) => ForgotPasswordRepoImpl(ref: ref),
);

// Set Forgot Password
final setForgotPasswordRepositoryProvider = Provider<SetForgotPasswordRepo>(
  (ref) => SetForgotPasswordRepoImpl(ref: ref),
);

// Update Password
final updatePasswordRepositoryProvider = Provider<UpdatePasswordRepo>(
  (ref) => UpdatePasswordRepoImpl(ref: ref),
);

// Verify Forgot Password
final verifyForgotPasswordRepositoryProvider = Provider<VerifyForgotPasswordRepo>(
  (ref) => VerifyForgotPasswordRepoImpl(ref: ref),
);

// AttendanceIn
final attendanceInRepositoryProvider = Provider<AttendanceInRepo>(
  (ref) => AttendanceInRepoImpl(ref: ref),
);

// AttendanceOut
final attendanceOutRepositoryProvider = Provider<AttendanceOutRepo>(
  (ref) => AttendanceOutRepoImpl(ref: ref),
);

// Login
final loginRepositoryProvider = Provider<LoginRepo>(
  (ref) => LoginRepoImpl(ref: ref),
);
//**************************************
//************   EDIT PROFILE  *********
//************************************** 
final editProfileRepositoryProvider = Provider<EditProfileRepo>(
  (ref) => EditProfileRepoImpl(ref: ref),
);
//**************************************
//************   GET CALENDAR  *********
//************************************** 
final getCalendarRepositoryProvider = Provider<GetCalendarRepo>(
  (ref) => GetCalendarRepoImpl(ref: ref),
);
//**************************************
//************   FETCH NOTIFICATION  *********
//************************************** 
final fetchNotificationRepositoryProvider = Provider<FetchNotificationRepo>(
  (ref) => FetchNotificationRepoImpl(ref: ref),
);