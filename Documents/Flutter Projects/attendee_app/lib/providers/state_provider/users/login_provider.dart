import 'package:attendee_app/state/users/login_notifier.dart';
import 'package:attendee_app/state/users/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Login
final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(ref),
);