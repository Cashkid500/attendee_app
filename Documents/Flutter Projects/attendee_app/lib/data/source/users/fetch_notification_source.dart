import 'dart:convert';
import 'dart:io';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/fetch_notification_abstract.dart';
import 'package:attendee_app/models/users/response/fetch_notification.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class FetchNotificationSourceImpl implements FetchNotificationSource{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  FetchNotificationSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<FetchNotificationResponse> fetchNotification()async {
    String url = AppEndpoints.fetchNotification;
    // final body = {
    //   "userid": payload.userid,
    // };
    String accessToken = AuthManager.instance.userCred?.data.token ?? "";
    print(accessToken);
    final response = await networkRetry.networkRetry(() => networkRequest.get(
          url,
          // body: json.encode(body),
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
          },
        ));
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final FetchNotificationResponse response =
            FetchNotificationResponse.fromJson(data);
        return response;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final FetchNotificationResponse response =
          FetchNotificationResponse.fromJson(data);
      try {
        if (response.status == false) {
          throw Exception(data['text']);
        } else {
          final errormessage = data['text'];
          throw Exception(errormessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}