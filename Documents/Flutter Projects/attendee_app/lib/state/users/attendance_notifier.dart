import 'package:attendee_app/data/repository/users/attendance_in_abstract.dart';
import 'package:attendee_app/data/repository/users/attendance_out_abstract.dart';
import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/attendance_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceInStateNotifier extends StateNotifier<AttendanceInState> {
  final AttendanceInRepo _attendanceinRepository;

  AttendanceInStateNotifier(Ref ref)
      : _attendanceinRepository = ref.read(attendanceInRepositoryProvider),
        super(AttendanceInInitial());

  Future<void> attendanceIn({
    required AttendanceInModel value,
  }) async {
    state = AttendanceInLoading();

    final userTransactionListOrError =
        await _attendanceinRepository.attendanceIn(value: value);

    state = userTransactionListOrError.fold(
      (l) => AttendanceInFailure(
        failure: l,
      ),
      (r) => AttendanceInSuccess(responseData: r),
    );

    if (state is AttendanceInFailure) {
      final failureState = state as AttendanceInFailure;
    } else if (state is AttendanceInSuccess) {}
  }
   void resetstate(){
     state = AttendanceInInitial();
  }

}






class AttendanceOutStateNotifier extends StateNotifier<AttendanceOutState> {
  final AttendanceOutRepo _attendanceOutRepository;

  AttendanceOutStateNotifier(Ref ref)
      : _attendanceOutRepository = ref.read(attendanceOutRepositoryProvider),
        super(AttendanceOutInitial());

  Future<void> attendanceOut({
    required AttendanceOutModel value,
  }) async {
    state = AttendanceOutLoading();

    final userTransactionListOrError =
        await _attendanceOutRepository.attendanceOut(value: value);

    state = userTransactionListOrError.fold(
      (l) => AttendanceOutFailure(
        failure: l,
      ),
      (r) => AttendanceOutSuccess(responseData: r),
    );

    if (state is AttendanceOutFailure) {
      final failureState = state as AttendanceOutFailure;
    } else if (state is AttendanceOutSuccess) {}
  }
   void resetstate(){
     state = AttendanceOutInitial();
  }
}
