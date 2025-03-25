import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/update_password_abstract.dart';
import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class UpdatePasswordSourceImpl implements UpdatePasswordSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  UpdatePasswordSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<UpdatePasswordResponse> updatePassword(
      {required UpdatePasswordModel payload}) async {
    String url = AppEndpoints.updatePassword;
    final body = {
      "password": payload.password,
      "new_password": payload.newPassword,
      "confirm_new_password": payload.confirmNewPassword,
    };
    String accessToken = AuthManager.instance.userCred?.data.token ?? "";
    print(accessToken);
    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        },
      ),
    );
    print(body);
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final UpdatePasswordResponse responseModel =
            UpdatePasswordResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final UpdatePasswordResponse responseModel =
          UpdatePasswordResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}