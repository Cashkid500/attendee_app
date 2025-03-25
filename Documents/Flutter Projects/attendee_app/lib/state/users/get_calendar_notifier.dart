import 'package:attendee_app/data/repository/users/get_calendar_abstract.dart';
import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/get_calendar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCalendarStateNotifier extends StateNotifier<GetCalendarState> {
  final GetCalendarRepo _getCalendarRepository;

  GetCalendarStateNotifier(Ref ref)
      : _getCalendarRepository = ref.read(getCalendarRepositoryProvider),
        super(GetCalendarInitial());

  Future<void> getCalendar({
    required GetCalendarModel payload,
  }) async {
    state = GetCalendarLoading();

    final userTransactionListOrError =
        await _getCalendarRepository.getCalendar(payload: payload);

    state = userTransactionListOrError.fold(
      (l) => GetCalendarFailure(
        failure: l,
      ),
      (r) => GetCalendarSuccess(responseData: r),
    );

    if (state is GetCalendarFailure) {
      final failureState = state as GetCalendarFailure;
    } else if (state is GetCalendarSuccess) {}
  }

  void resetstate() {
    state = GetCalendarInitial();
  }
}
