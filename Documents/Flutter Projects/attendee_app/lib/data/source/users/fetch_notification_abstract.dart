
import 'package:attendee_app/models/users/response/fetch_notification.dart';

abstract class FetchNotificationSource {
  Future<FetchNotificationResponse> fetchNotification();
}
