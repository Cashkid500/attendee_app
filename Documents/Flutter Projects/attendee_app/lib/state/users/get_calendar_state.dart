import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/get_calendar.dart';

class GetCalendarState {}

class GetCalendarInitial extends GetCalendarState {}

class GetCalendarLoading extends GetCalendarState {}

class GetCalendarFailure extends GetCalendarState {
  final Failure failure;
  GetCalendarFailure({required this.failure});
}

class GetCalendarSuccess extends GetCalendarState {
  final GetCalendarResponse responseData;
  GetCalendarSuccess({required this.responseData});
}
