import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/fetch_notification_abstract.dart';
import 'package:attendee_app/data/source/users/fetch_notification_abstract.dart';
import 'package:attendee_app/models/users/response/fetch_notification.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchNotificationRepoImpl implements FetchNotificationRepo{
  final NetworkInfo netinfo;
  final FetchNotificationSource fetch;
  FetchNotificationRepoImpl({required Ref ref})
  : fetch = ref.read(fecthNotificationSourceProvider),
  netinfo = ref.read(networkInfoProvider);

  @override
   Future<Either<Failure, FetchNotificationResponse>> fetchNotification()async{
      ServiceRunner<Failure, FetchNotificationResponse> sR = ServiceRunner(netinfo);

    return sR.tryRemoteandCatch(
      call: fetch.fetchNotification(),
      errorTitle: "Error, unable to take Attendance,"
    );
  }

  
}