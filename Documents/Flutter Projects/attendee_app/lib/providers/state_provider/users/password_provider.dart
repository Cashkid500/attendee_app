import 'package:attendee_app/state/users/password_notifier.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Forgot Password
final forgotPasswordStateNotifierProvider =
    StateNotifierProvider<ForgotPasswordStateNotifier, ForgotPasswordState>(
  (ref) => ForgotPasswordStateNotifier(ref),
);

// Set Forgot Password
final setForgotPasswordStateNotifierProvider =
    StateNotifierProvider<SetForgotPasswordStateNotifier, SetForgotPasswordState>(
  (ref) => SetForgotPasswordStateNotifier(ref),
);

// Verify Forgot Password
final verifyForgotPasswordStateNotifierProvider =
    StateNotifierProvider<VerifyForgotPasswordStateNotifier, VerifyForgotPasswordState>(
  (ref) => VerifyForgotPasswordStateNotifier(ref),
);

// Update Password
final updatePasswordStateNotifierProvider =
    StateNotifierProvider<UpdatePasswordStateNotifier, UpdatePasswordState>(
  (ref) => UpdatePasswordStateNotifier(ref),
);