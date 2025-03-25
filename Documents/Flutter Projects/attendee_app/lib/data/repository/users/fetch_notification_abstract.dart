import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/fetch_notification.dart';
import 'package:attendee_app/models/users/response/fetch_notification.dart';
import 'package:dartz/dartz.dart';

abstract class FetchNotificationRepo{
  Future<Either<Failure, FetchNotificationResponse>> fetchNotification();
}