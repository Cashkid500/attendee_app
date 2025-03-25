import 'package:attendee_app/state/users/edit_profile_notifier.dart';
import 'package:attendee_app/state/users/edit_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProfileNotifierProvider =
    StateNotifierProvider<EditProfileStateNotifier, EditProfileState>(
  (ref) => EditProfileStateNotifier(ref),
);
