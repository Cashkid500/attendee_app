import 'package:attendee_app/state/users/fetch_notification_notifier.dart';
import 'package:attendee_app/state/users/fetch_notification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchNotificationNotifierProvider = StateNotifierProvider<
    FetchNotificationStateNotifier, FetchNotificationState>(
  (ref) => FetchNotificationStateNotifier(ref),
);
