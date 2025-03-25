import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/attendance_out_abstract.dart';
import 'package:attendee_app/data/source/users/attendance_out_abstract.dart';
import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceOutRepoImpl implements AttendanceOutRepo{
  final NetworkInfo netinfo;
  final AttendanceOut attendance;
  AttendanceOutRepoImpl({required Ref ref})
  : attendance = ref.read(attendanceOutSourceProvider),
  netinfo = ref.read(networkInfoProvider);

  @override
   Future<Either<Failure, AttendanceOutResponse>> attendanceOut({
    required AttendanceOutModel value,
  }){
      ServiceRunner<Failure, AttendanceOutResponse> sR = ServiceRunner(netinfo);

    return sR.tryRemoteandCatch(
      call: attendance.attendanceOut(value: value),
      errorTitle: "Error, unable to take Attendance,"
    );
  }

  
}