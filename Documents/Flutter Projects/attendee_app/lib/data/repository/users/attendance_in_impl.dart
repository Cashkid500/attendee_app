import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/attendance_in_abstract.dart';
import 'package:attendee_app/data/source/users/attendance_in_abstract.dart';
import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceInRepoImpl implements AttendanceInRepo{
  final NetworkInfo netinfo;
  final AttendanceIn attendance;
  AttendanceInRepoImpl({required Ref ref})
  :attendance = ref.read(attendanceInSourceProvider),
  netinfo = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, AttendanceInResponse>> attendanceIn({
    required AttendanceInModel value,
  }){
     ServiceRunner<Failure, AttendanceInResponse> sR = ServiceRunner(netinfo);

    return sR.tryRemoteandCatch(
      call: attendance.attendanceIn(value: value),
      errorTitle: "Error, unable to take Attendance,"
    );
  }
}