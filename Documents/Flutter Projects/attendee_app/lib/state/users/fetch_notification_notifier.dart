import 'package:attendee_app/data/repository/users/fetch_notification_abstract.dart';
import 'package:attendee_app/models/users/body/fetch_notification.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/fetch_notification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchNotificationStateNotifier
    extends StateNotifier<FetchNotificationState> {
  final FetchNotificationRepo _fehchNotificationRepository;

  FetchNotificationStateNotifier(Ref ref)
      : _fehchNotificationRepository =
            ref.read(fetchNotificationRepositoryProvider),
        super(FetchNotificationInitial());

  Future<void> fetchNotification({
    required FetchNotificationModel payload,
  }) async {
    state = FetchNotificationLoading();

    final userTransactionListOrError =
        await _fehchNotificationRepository.fetchNotification();

    state = userTransactionListOrError.fold(
      (l) => FetchNotificationFailure(
        failure: l,
      ),
      (r) => FetchNotificationSuccess(responseData: r),
    );

    if (state is FetchNotificationFailure) {
      final failureState = state as FetchNotificationFailure;
    } else if (state is FetchNotificationSuccess) {}
  }

  void resetstate() {
    state = FetchNotificationInitial();
  }
}
