import 'package:attendee_app/state/users/get_calendar_notifier.dart';
import 'package:attendee_app/state/users/get_calendar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCalendarNotifierProvider =
    StateNotifierProvider<GetCalendarStateNotifier, GetCalendarState>(
  (ref) => GetCalendarStateNotifier(ref),
);
