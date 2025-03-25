import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:attendee_app/models/users/response/get_calendar.dart';

abstract class GetCalendarSource {
  Future<GetCalendarResponse> getCalendar({
    required GetCalendarModel payload,
  });
}