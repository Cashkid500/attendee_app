import 'package:attendee_app/data/source/users/attendance_in_abstract.dart';
import 'package:attendee_app/data/source/users/attendance_in_source.dart';
import 'package:attendee_app/data/source/users/attendance_out_abstract.dart';
import 'package:attendee_app/data/source/users/attendance_out_source.dart';
import 'package:attendee_app/data/source/users/edit_profile_abstract.dart';
import 'package:attendee_app/data/source/users/edit_profile_source.dart';
import 'package:attendee_app/data/source/users/fetch_notification_abstract.dart';
import 'package:attendee_app/data/source/users/fetch_notification_source.dart';
import 'package:attendee_app/data/source/users/forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/forgot_password_source.dart';
import 'package:attendee_app/data/source/users/get_calendar_abstract.dart';
import 'package:attendee_app/data/source/users/get_calendar_source.dart';
import 'package:attendee_app/data/source/users/login_abstract.dart';
import 'package:attendee_app/data/source/users/login_source.dart';
import 'package:attendee_app/data/source/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/set_forgot_password_source.dart';
import 'package:attendee_app/data/source/users/update_password_abstract.dart';
import 'package:attendee_app/data/source/users/update_password_source.dart';
import 'package:attendee_app/data/source/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/verify_forgot_password_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'network_provider.dart';

// LoginSourceProvider
final loginSourceProvider = Provider<Login>(
  (ref) => LoginSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// AttendanceSourceProvider
final attendanceInSourceProvider = Provider<AttendanceIn>(
  (ref) => AttendanceInSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

final attendanceOutSourceProvider = Provider<AttendanceOut>(
  (ref) => AttendanceOutSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// Forgot Password
final forgotPasswordSourceProvider = Provider<ForgotPasswordSource>(
  (ref) => ForgotPasswordSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// Update Password
final updatePasswordSourceProvider = Provider<UpdatePasswordSource>(
  (ref) => UpdatePasswordSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// Set Forgot Password
final setForgotPasswordSourceProvider = Provider<SetForgotPasswordSource>(
  (ref) => SetForgotPasswordSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// Verify Forgot Password
final verifyForgotPasswordSourceProvider = Provider<VerifyForgotPasswordSource>(
  (ref) => VerifyForgotPasswordSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// FetchNotificationSourceProvider
final fecthNotificationSourceProvider = Provider<FetchNotificationSource>(
  (ref) => FetchNotificationSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// GetCalendarSourceProvider
final getCalendarSourceProvider = Provider<GetCalendarSource>(
  (ref) => GetCalendarSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
//*****************************************************
//****************   EditProfileSourceProvider   ******
//*****************************************************
final editProfileSourceImplProvider = Provider<EditProfileSource>(
  (ref) => EditProfileSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

