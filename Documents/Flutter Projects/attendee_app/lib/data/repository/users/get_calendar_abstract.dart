import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:attendee_app/models/users/response/get_calendar.dart';
import 'package:dartz/dartz.dart';

abstract class GetCalendarRepo{
  Future<Either<Failure, GetCalendarResponse>> getCalendar({
     required GetCalendarModel
      payload,
  });
}