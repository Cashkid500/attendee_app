import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/fetch_notification.dart';
import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:flutter/src/widgets/text.dart';

class FetchNotificationState {
  // Widget(
  //     {required ListView Function(dynamic notifications) data,
  //     required CircularProgressIndicator Function() loading,
  //     required Text Function(dynamic error, dynamic stackTrace) error}) {}
}

class FetchNotificationInitial extends FetchNotificationState {}

class FetchNotificationLoading extends FetchNotificationState {}

class FetchNotificationFailure extends FetchNotificationState {
  final Failure failure;
  FetchNotificationFailure({required this.failure});
}

class FetchNotificationSuccess extends FetchNotificationState {
  final FetchNotificationResponse responseData;
  FetchNotificationSuccess({required this.responseData});
}
