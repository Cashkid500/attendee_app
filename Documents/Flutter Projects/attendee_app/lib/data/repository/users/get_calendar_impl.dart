import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/get_calendar_abstract.dart';
import 'package:attendee_app/data/source/users/get_calendar_abstract.dart';
import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:attendee_app/models/users/response/get_calendar.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCalendarRepoImpl implements GetCalendarRepo {
  final NetworkInfo net;
  final GetCalendarSource Uereg;
  GetCalendarRepoImpl({required Ref ref})
      : Uereg = ref.read(getCalendarSourceProvider),
        net = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, GetCalendarResponse>> getCalendar({
    required GetCalendarModel payload,
  }) async{
    ServiceRunner<Failure, GetCalendarResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
        call: Uereg.getCalendar(payload: payload),
        errorTitle: "Error Unregister Domain,");
  }
}
